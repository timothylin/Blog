using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using Blog.BLL;
using Blog.Data;

namespace Blog.UI.ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            //var repo = new BlogRepository();

            //var user = repo.UpdateRoleByUserId("06c53da2-4bfe-4a1f-86ad-cf045b593317", "0");

            //foreach (var identityUserRole in user.Roles)
            //{
            //    Console.WriteLine(identityUserRole.RoleId);
            //    Console.WriteLine(identityUserRole.UserId);
            //}

            //Console.WriteLine(user.Id);

            //var hashtags = repo.GetAllBlogPosts();

            //foreach (var hashtag in hashtags)
            //{
            //    Console.WriteLine(hashtag.HashtagId);
            //    Console.WriteLine(hashtag.HashtagTitle);
            //}

            //var blogPosts = repo.GetAllBlogPosts();

            //foreach (var blogPost in blogPosts)
            //{
            //    Console.WriteLine(blogPost.BlogPostId);

            //    foreach (var hashtag in blogPost.Hashtags)
            //    {
            //        Console.WriteLine(hashtag.HashtagId);
            //        Console.WriteLine(hashtag.HashtagTitle);
            //    }

            //    Console.WriteLine(blogPost.BlogPostTitle);
            //    Console.WriteLine(blogPost.BlogPostText);

            //}

            //var ops = new BlogOperations();

            //var blog = ops.GetBlogPostById(2);

            //Console.WriteLine(blog.BlogPost.BlogPostId);
            //Console.WriteLine(blog.BlogPost.BlogPostText);
            //Console.WriteLine(blog.BlogPost.BlogPostTitle);

            Console.ReadLine();
        }
    }
}
