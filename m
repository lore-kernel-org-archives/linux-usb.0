Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D243CB2E5;
	Fri, 31 Jul 2026 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494297; cv=none; b=Suu2sELY7ZoHmJzqS9i+44gpzItigC0OJLrCsLozHJayVx9mkkN3LJqLxUqeIwXc8RD5XDNxLW67SghQekCjyFEKx/JxK5ClqFjWs8ybyBscunOVt+kd/w3+tzZlgLLvADvCh2Eo9J5CrRakRxnV9Bmo/e5sXFXQjAC9m86QFgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494297; c=relaxed/simple;
	bh=KICw2dhX/p2IV6W+4OHpSt1fCe5LNqlUWX3NnDonHDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0+q12m8lfZvOuixLi4OF+YENZOa7CRaXdgEp847th+IW4PdSU1F+/QnjRRzrTpONKotREy8L09t0whtNI3Rl64MCfA8v7bQfpDmlddJH0i8klrKw/JL8B8et89YKS+eyfHUkB01D676rLtkuLsN8o6qDxC1bpSKM/+szoX2CkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hKovOOyJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hKovOOyJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16B31F000E9;
	Fri, 31 Jul 2026 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785494285;
	bh=rhZrEfyeBz/qU3FaGD3A7FXqRT9TvedWPtBDqWMN61o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hKovOOyJTPpOgXvZLRa5pW/aZVx1cvRGEsELZvdW9TobbBv0rFMMbMvwHHGPxBOmb
	 CKlAyzTpc/vcn5C2SKBEJXeqoYzGik4YYCK/A8Jsf+i6/IMJDELUW/NPSWnM7oeyGK
	 CVogTF4JyHlrvq74Zv0ANXl5UQnJZJn2rBc74o1E=
Date: Fri, 31 Jul 2026 12:37:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: viro@zeniv.linux.org.uk, jack@suse.cz, brauner@kernel.org,
	mjguzik@gmail.com, kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadgetfs: fix use-after-free in ep_open()
Message-ID: <2026073135-tiny-frightful-ea54@gregkh>
References: <20260731091316.14145-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731091316.14145-1-kartikey406@gmail.com>

On Fri, Jul 31, 2026 at 02:43:16PM +0530, Deepanshu Kartikey wrote:
> ep_open() dereferenced inode->i_private and locked its embedded
> mutex before checking whether the underlying ep_data was still
> alive. destroy_ep_files(), called from gadgetfs_unbind(), can free
> that same ep_data concurrently, since nothing prevented an in-flight
> open() from racing the teardown. KASAN reports a slab-use-after-free
> in ep_open(), with the object freed by a concurrent gadgetfs_unbind()
> -> destroy_ep_files() -> put_ep() -> kfree().
> 
> Fix it by adding an inode back-pointer to ep_data, having
> destroy_ep_files() clear inode->i_private to NULL under dev->lock
> before the object can be freed, and having ep_open() read
> inode->i_private and pin the result with get_ep() under that same
> lock, bailing out with -ENOENT if it finds NULL. This makes liveness
> self-evident at the point of use instead of being inferred from
> device state, so it holds regardless of which path frees the
> endpoint.
> 
> gadgetfs_create_file() gains an optional inode-out parameter so
> activate_ep_files() can capture the inode it creates; the ep0 caller
> in gadgetfs_fill_super() passes NULL, since dev_data is unaffected
> by this fix.
> 
> Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

What commit id does this fix?

And how did you find this?  Test it?

> ---
>  drivers/usb/gadget/legacy/inode.c | 51 +++++++++++++++++++++----------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab51510..f566b2ec7c38 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -207,6 +207,7 @@ struct ep_data {
>  	struct usb_endpoint_descriptor	desc, hs_desc;
>  	struct list_head		epfiles;
>  	wait_queue_head_t		wait;
> +	struct inode                    *inode;
>  };
>  
>  static inline void get_ep (struct ep_data *data)
> @@ -235,6 +236,7 @@ static void put_ep (struct ep_data *data)
>  
>  static const char *CHIP;
>  static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */
> +static struct dev_data *the_device;

Do we really want a single "device"?  Ah, it comes from elsewhere in
thsi file, that's really not good...

And do you even use this code?  I ask as I'd really like to get rid of
all of the legacy gadget driver code.  I think Android was the last user
and they aren't using it anymore from what I can tell, but I could be
wrong...


>  
>  /*----------------------------------------------------------------------*/
>  
> @@ -817,25 +819,39 @@ ep_config (struct ep_data *data, const char *buf, size_t len)
>  static int
>  ep_open (struct inode *inode, struct file *fd)
>  {
> -	struct ep_data		*data = inode->i_private;
> -	int			value = -EBUSY;
> +	struct dev_data *dev = the_device;

Why isn't this coming from the inode or file?


> +	struct ep_data *data;
> +	int value = -ENODEV;
> +
> +	spin_lock_irq(&dev->lock);
> +	data = inode->i_private;
> +	if (data == NULL) {
> +		spin_unlock_irq(&dev->lock);
> +		return -ENOENT;
> +	}
> +	get_ep(data);
> +	spin_unlock_irq(&dev->lock);
>  
> -	if (mutex_lock_interruptible(&data->lock) != 0)
> +	if (mutex_lock_interruptible(&data->lock) != 0) {
> +		put_ep(data);
>  		return -EINTR;
> -	spin_lock_irq (&data->dev->lock);
> -	if (data->dev->state == STATE_DEV_UNBOUND)
> +	}
> +
> +	value = -EBUSY;
> +	spin_lock_irq(&dev->lock);
> +	if (dev->state == STATE_DEV_UNBOUND)
>  		value = -ENOENT;
>  	else if (data->state == STATE_EP_DISABLED) {
>  		value = 0;
>  		data->state = STATE_EP_READY;
> -		get_ep (data);
>  		fd->private_data = data;
> -		VDEBUG (data->dev, "%s ready\n", data->name);
> +		VDEBUG(dev, "%s ready\n", data->name);
>  	} else
> -		DBG (data->dev, "%s state %d\n",
> -			data->name, data->state);
> -	spin_unlock_irq (&data->dev->lock);
> +		DBG(dev, "%s state %d\n", data->name, data->state);
> +	spin_unlock_irq(&dev->lock);
>  	mutex_unlock(&data->lock);
> +	if (value)
> +		put_ep(data);
>  	return value;
>  }
>  
> @@ -1563,6 +1579,7 @@ static void destroy_ep_files (struct dev_data *dev)
>  		/* break link to FS */
>  		ep = list_first_entry (&dev->epfiles, struct ep_data, epfiles);
>  		list_del_init (&ep->epfiles);
> +		ep->inode->i_private = NULL;
>  		spin_unlock_irq (&dev->lock);
>  
>  		/* break link to controller */
> @@ -1588,7 +1605,8 @@ static void destroy_ep_files (struct dev_data *dev)
>  
>  
>  static int gadgetfs_create_file (struct super_block *sb, char const *name,
> -		void *data, const struct file_operations *fops);
> +		void *data, const struct file_operations *fops,
> +		struct inode **inode_out);
>  
>  static int activate_ep_files (struct dev_data *dev)
>  {
> @@ -1618,7 +1636,7 @@ static int activate_ep_files (struct dev_data *dev)
>  			goto enomem1;
>  
>  		err = gadgetfs_create_file (dev->sb, data->name,
> -				data, &ep_io_operations);
> +				data, &ep_io_operations, &data->inode);
>  		if (err)
>  			goto enomem2;
>  		list_add_tail (&data->epfiles, &dev->epfiles);
> @@ -1663,8 +1681,6 @@ gadgetfs_unbind (struct usb_gadget *gadget)
>  	put_dev (dev);
>  }
>  
> -static struct dev_data		*the_device;
> -
>  static int gadgetfs_bind(struct usb_gadget *gadget,
>  		struct usb_gadget_driver *driver)
>  {
> @@ -1984,7 +2000,7 @@ gadgetfs_make_inode (struct super_block *sb,
>   * so inode and dentry are paired, until device reconfig.
>   */
>  static int gadgetfs_create_file (struct super_block *sb, char const *name,
> -		void *data, const struct file_operations *fops)
> +		void *data, const struct file_operations *fops, struct inode **inode_out)
>  {
>  	struct dentry	*dentry;
>  	struct inode	*inode;
> @@ -1994,6 +2010,9 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
>  	if (!inode)
>  		return -ENOMEM;
>  
> +	if (inode_out)
> +		*inode_out = inode;
> +
>  	dentry = simple_start_creating(sb->s_root, name);
>  	if (IS_ERR(dentry)) {
>  		iput(inode);
> @@ -2056,7 +2075,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
>  		goto Enomem;
>  
>  	dev->sb = sb;
> -	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
> +	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations, NULL);

When we have to look up what a random parameter is, when you set it to
NULL, that's usually not a good way to write a function.

thanks,

gre k-h
