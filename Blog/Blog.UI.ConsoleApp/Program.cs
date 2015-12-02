using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using Blog.Data;

namespace Blog.UI.ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var repo = new BlogRepository();

            //var hashtags = repo.GetAllBlogPosts();

            //foreach (var hashtag in hashtags)
            //{
            //    Console.WriteLine(hashtag.HashtagId);
            //    Console.WriteLine(hashtag.HashtagTitle);
            //}

            var blogPosts = repo.GetAllBlogPosts();

            foreach (var blogPost in blogPosts)
            {
                Console.WriteLine(blogPost.BlogPostId);

                foreach (var hashtag in blogPost.Hashtags)
                {
                    Console.WriteLine(hashtag.HashtagId);
                    Console.WriteLine(hashtag.HashtagTitle);
                }

                Console.WriteLine(blogPost.BlogPostTitle);
                Console.WriteLine(blogPost.BlogPostText);

            }

            Console.ReadLine();
        }
    }
}
