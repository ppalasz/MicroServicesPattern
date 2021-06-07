﻿using Catalog.API.Data.Interfaces;
using Catalog.API.Entities;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;

namespace Catalog.API.Data
{
	public class CatalogContext : ICatalogContext
	{
		public CatalogContext(IConfiguration configuration)
		{
			var connectionString = configuration
				.GetValue<string>("DatabaseSettings:ConnectionString");

			var databaseName = configuration
				.GetValue<string>("DatabaseSettings:DatabaseName");

			var collectionName = configuration
				.GetValue<string>("DatabaseSettings:CollectionName");

			var client = new MongoClient(connectionString);
			var database = client.GetDatabase(databaseName);

			Products = database.GetCollection<Product>(collectionName);

			CatalogContextSeed.SeedData(Products);
		}

		public IMongoCollection<Product> Products { get; }
	}
}