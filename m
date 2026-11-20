Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169933;
	b=Kov0E5vfx7PK9m2n0qasp60P4J4g+OK9f4DNWEzR/OUgVI6/zVlx/9tKq2D0ik/ZWGlr
	 WK4IuwgAbfzNEL3J0QP1IZS/3ZmpjLKaHmIEAFr0rCro+8BGa1Nx2y61bMQAoAekRHrZu
	 eGInR9k1BZIXlm+g7mhLY6RWXDOa5xhNWbcVtkwj5nKmb1gVLh5VPeJSTAuiQdrv+vnAr
	 me5y5cer8uls/TIEveNuIu0oc8n35O7H13ey8B1mW57q1991ddrJjBPCKyfqa+cJszpJx
	 M5ezupA4+OESdYVPvbKDEOdpDanW2vl5YLAz7vtk+dNYKgvTUCFPHH0h66a+6zTx8WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169933;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jpt7YuyE3CuaMPkQyTp5Pq8xB1K9oXA3ItVSLkbFsTg=;
	b=TWCBIFPSzrg7E2zfzAsQCMHF7Fe8DhUW2tAaxEL0s9DySJQKzh+KzNy/naQmIl7Md9iq
	 CWCeTzKnJVngtZ8JHpNSYXiuuqB3DchIfjx0yRIlFC6P/c/gv5vWF3xj5Xn6SKBoerbQD
	 kFg4m43e4MYEWWtq6kPM6NkKW+2YPiZUnR+9Gr+85DwUNPaxupZr4Du9OLcgtHNjCgFuR
	 UfD+vLWmBDVWApK17HNbqhyue0oVFADVS7Cspm9WDRMv0PMlKVgF/foJdjvkSVC0gJNyG
	 v2f4upPu68uV5KWSHKlcdBTuS43ZJdKRgCotulu3Z4PZR1j2bdNiipJjRjSwQrBayuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1r6k2mg8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B42C606A320;
	Fri, 20 Nov 2026 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1r6k2mg8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7A21F000CA;
	Fri, 20 Nov 2026 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795169932;
	bh=jpt7YuyE3CuaMPkQyTp5Pq8xB1K9oXA3ItVSLkbFsTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1r6k2mg8KjCc5W5qyqaPCeOskz/Uot0jp660tilSlSb5iqoZKJJskq4KpOX/Hq+ez
	 mEpSqu4EPBZyM/ECYnlfxRLdaSHLngyGvmIUNBhQFGqlNavjXGPknOHrYmicGiVW/C
	 DvQFyLYPkMideR9RiVLBwJCHXr2K8iP2TykeS/D4=
Date: Fri, 20 Nov 2026 11:18:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mohammad Mosafer <mohsafer@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: gadget: f_fs: fix use-after-free in ffs_closed()
 on umount
Message-ID: <2026112030-aflame-skid-859a@gregkh>
References: <20261006210523.150724-1-mohsafer@gmail.com>
 <20261006214940.158352-1-mohsafer@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006214940.158352-1-mohsafer@gmail.com>

On Tue, Oct 06, 2026 at 04:49:40PM -0500, Mohammad Mosafer wrote:
> ffs_free_inst() releases the ffs_dev with ffs_release_dev() and only
> then re-acquires ffs_dev_lock to free it with _ffs_free_dev().  In
> between, the dev is still linked on the ffs_devices list while already
> marked unmounted, so a concurrent mount(2) of functionfs finds it by
> name in ffs_acquire_dev() and links a fresh ffs_data to the doomed dev
> (ffs_data->private_data = dev).  _ffs_free_dev() then kfrees the dev,
> and when that mount is torn down, ffs_closed() dereferences the stale
> ffs->private_data:
> 
>   BUG: KASAN: slab-use-after-free in ffs_data_clear+0x438/0x530
>   Write of size 1 at addr ffff88810594664a by task repro/116
>     ffs_data_clear+0x438/0x530
>     ffs_fs_kill_sb+0x7b/0x510
>     deactivate_locked_super+0xa9/0x200
>     cleanup_mnt+0x255/0x380
>     ... reached via umount(2)
>   Freed by task 112:
>     kfree+0x127/0x3b0
>     ffs_free_inst+0x10c/0x1a0
>     usb_put_function_instance+0x8a/0xc0
>     configfs_rmdir+0x773/0x9c0
>   Allocated by task 113:
>     ffs_alloc_inst+0x109/0x360
>     function_make+0x138/0x330
>     configfs_mkdir+0x48b/0x1090
> 
> Hold ffs_dev_lock across the release and the free so that a released
> dev is never findable, splitting ffs_release_dev() into a lock-assuming
> _ffs_release_dev() (matching the _ffs_* convention in this file).  For
> the same reason, re-read ffs->private_data under ffs_dev_lock in
> ffs_data_put(): the argument read there was unlocked, so a concurrent
> ffs_free_inst() could unlink and free the dev while the putter waited
> on the mutex, and the subsequent ffs_release_dev() would dereference
> the freed dev.  The now unreached ffs_release_dev() wrapper is dropped;
> its remaining callers use _ffs_release_dev() with the lock held.
> 
> The race was reproduced with a multi-threaded harness racing configfs
> mkdir/rmdir of the ffs instance against mount/umount of functionfs on
> a KASAN kernel: the unpatched kernel reports the use-after-free
> reliably (2/2 runs), the patched kernel survives an extended soak with
> identical churn (2/2 runs clean).
> 
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
> Fixes: 5920cda627688c ("usb: gadget: FunctionFS: convert to new function interface with backward compatibility")
> Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
> ---
> 
> Changes in v2:
> - Re-read ffs->private_data under ffs_dev_lock in ffs_data_put(): the
>   unlocked argument read raced with a concurrent ffs_free_inst() freeing
>   the dev while the putter waited on ffs_dev_lock (flagged by the
>   Sashiko review bot).
> - Drop the now-unused ffs_release_dev() wrapper.
>  drivers/usb/gadget/function/f_fs.c | 31 ++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index c64a268e98a4..960b73dc06b3 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -288,7 +288,7 @@ static struct ffs_dev *_ffs_find_dev(const char *name);
>  static struct ffs_dev *_ffs_alloc_dev(void);
>  static void _ffs_free_dev(struct ffs_dev *dev);
>  static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data);
> -static void ffs_release_dev(struct ffs_dev *ffs_dev);
> +static void _ffs_release_dev(struct ffs_dev *ffs_dev);
>  static int ffs_ready(struct ffs_data *ffs);
>  static void ffs_closed(struct ffs_data *ffs);
>  static void ffs_reset_work(struct work_struct *work);
> @@ -2231,7 +2231,14 @@ static void ffs_data_put(struct ffs_data *ffs)
>  	if (refcount_dec_and_test(&ffs->ref)) {
>  		pr_info("%s(): freeing\n", __func__);
>  		ffs_data_clear(ffs);
> -		ffs_release_dev(ffs->private_data);
> +		/*
> +		 * ffs->private_data must be re-read under ffs_dev_lock:
> +		 * a concurrent ffs_free_inst() may have NULLed it and
> +		 * freed the dev it pointed to.
> +		 */
> +		ffs_dev_lock();
> +		_ffs_release_dev(ffs->private_data);
> +		ffs_dev_unlock();
>  		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
>  		       swait_active(&ffs->ep0req_completion.wait) ||
>  		       waitqueue_active(&ffs->wait));
> @@ -4147,8 +4154,17 @@ static void ffs_free_inst(struct usb_function_instance *f)
>  	struct f_fs_opts *opts;
>  
>  	opts = to_f_fs_opts(f);
> -	ffs_release_dev(opts->dev);
> +
> +	/*
> +	 * Release and free the dev under a single ffs_dev_lock critical
> +	 * section. Between ffs_release_dev() and _ffs_free_dev() the dev
> +	 * would still be on the ffs_devices list while already unmounted,
> +	 * so a concurrent ffs_acquire_dev() could link a fresh ffs_data to
> +	 * the doomed dev, leaving it with a dangling ->private_data that is
> +	 * dereferenced in ffs_closed() when that mount is torn down.
> +	 */

That comment isn't needed, right?

>  	ffs_dev_lock();
> +	_ffs_release_dev(opts->dev);
>  	_ffs_free_dev(opts->dev);
>  	ffs_dev_unlock();
>  	kfree(opts);
> @@ -4363,10 +4379,11 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
>  	return ret;
>  }
>  
> -static void ffs_release_dev(struct ffs_dev *ffs_dev)
> +/*
> + * ffs_dev_lock must be taken by the caller

Then enforce it please.

thanks,

greg k-h
