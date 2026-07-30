Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D17413D8F
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421202; cv=none; b=WAU3iHLDonqhpJkYZXPCTfXrGf5ThFKnofDK9BZuNOOKh5ok/I6mdpD+OXw5zCcF1shZqgyg1qi2uzn9WXCc1DSEX7QPS9AvZjQ9ZI5F4dBxwW7rnQVfGcwfrD181wY5lgWZ1eUiRCDu63AHLTLzjVEys4OM5hYcX9DAhkZIs/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421202; c=relaxed/simple;
	bh=uzVHkoFtu9PuD6ldtGD6VXnYVVZKoXZ1WuQ/zSlmWtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONWlmj9Xrt4jVL2aFg9Taa/h77T4T+jHIiyjwHYfN4BA4DHY/NiNv6YBDhxWEwLymPz+oUhbNThEQ+6+Sk8QFP/0Ug11rFWOOIJNpYXFfjqGhAp2QRKKvDlK3GK1ApQwdKM9Rze8iEbNPr5jGrf1ubZKGR7Tl2QRxecev+kwHAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bJkeT/4R; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bJkeT/4R"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e512a9a6bso118916485a.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785421199; x=1786025999; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mgSmKW8C5q5q19WAqhGJ8tODkbTP7yIbhwQzeSyaTKk=;
        b=bJkeT/4Renjg/oyz3Kaq2lTcW1iB9xugAOw26SUegtwVAvPeNHHfk2lURJQ0nXHiip
         epS+LGBAoA4ulwc99a0G9YFiHQATy6YtX2oVmxdLJntOelCFRGik3nw7fSUUnlCyis+l
         GuTrmeyA9aL6g08EiDjwWTY24hAkrolCqQmTTtu5bpMy14zELjGgj/2Ty6bo8zHujAEX
         kAymwzfSKJi+po3LMQDR7RSZmOJL+rd+7YWfP9WELEx+0gSMVOJ0hKe2Vs/COT85nfR+
         v4fGFkwpVT8JxITVLUcgSRZT/MIy+2M/Hm7k+ytrBnDr26MnJlnJtDtSrBKKutBOMNIO
         aLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421199; x=1786025999;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mgSmKW8C5q5q19WAqhGJ8tODkbTP7yIbhwQzeSyaTKk=;
        b=QgPmPOBR0a6OeOq0IF0onnuj61lYtjrpHMO3yqzRhhElGJeBgV6+kCntxGW+O3CztT
         9rIeODKLrjGNijfh/yscwqSdzL74NGT9EPMZJ8Tjz2nbHVqr7PDU64vG6NBdCdKpjtz+
         vrps/URs6oz6xkg7TKt80F/Egf0PTiaQZsmf0TKuPOXphnEC5zOz8XmStdcFRKDHuQ3S
         71rJjs5DzIjkTT5pZl3sa6q9ySKBazrekONUGL38ofwpz+WZeQeLzsrAg9tkKPUS7/Is
         JUxzZt0ly0KGfQa+8A/IFGuz2Q68r8lK7tXt+ylfWhtA8+HiOk8PbLdKWnIO2EDkGWa6
         57mw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8hq4bpG/4M0CNL7QJ9SxsL/UVxkrUmiPzdROw5kR5S0KZxSVYJ4YpuR/x2AibXl72AU/kVUrBlb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+TfEPGOHurVsYTYglfQ0rg4QjEySgMtJOHdcLMbkx4E8aPC26
	1TRTCFxQHYB9kKag5FkbCH52cPav2RpSiVEmx6P1JI9h+zBHDsUmO8uw0rp9T5Qvvg==
X-Gm-Gg: AR+sD132cOApFmeJL9MU95uQnDbTNp+Cv0wUDQzGpZG4HsXf01sS5MhkrAu4+Nv5ahy
	v3sVOaZGdiKNzzlaCQMqhQlmGRfYI8cR07IM6gj0ov9/Jg/nszlB/z1yhUIFL97jK4dcU9NaKZs
	4Ho2nCnwLiLaOFOAWy65YHg0VFkpKFe8qHKVfBWMc5s2huhi6BYZoYmoaoIvcBPD0lOG2/FZk1Q
	U4zfrJ/5O6t6nIzH1aFY7lsqqV8PhVqUqbKHPosovEznuO4+YaAnFJWrIfZ+1zv84qk2nB05ir6
	+XLTmWMC2hIMQ0mcVjcMgoz7PeCsRSjcQQWbq84ICoxt2EHq+XQLdRdyrTSMEfijBIoLR2bmsPi
	zgM4o3mtdowy78iG9xR1m2tlO9DdpVOvypPlbuZXTmqh4d4aQzsujJkwPN+CzECxFPi09a+2lei
	AGrLu0QoHX7t2E7KjBxh3atNV5LKrZUI6LXWK4Rwc8kzHgciLJrJg553U/R0ufM1G/2CpWKfv5s
	WAkxqjYo1g+g9hb2Q==
X-Received: by 2002:a05:622a:5d1:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b3849847amr27390891cf.29.1785421198981;
        Thu, 30 Jul 2026 07:19:58 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2b649b9sm43153941cf.11.2026.07.30.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:19:57 -0700 (PDT)
Date: Thu, 30 Jul 2026 10:19:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Lei, Xue" <Xue.Lei@windriver.com>
Cc: gregkh@linuxfoundation.org, kyungmin.park@samsung.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_mass_storage: reject relative paths to
 fix sb_writers deadlock
Message-ID: <085a5b28-97c3-4934-9006-bb140c45ebcf@rowland.harvard.edu>
References: <20260729103245.3744500-1-Xue.Lei@windriver.com>
 <d1cd4b2b-6389-40af-8637-1d3fa46c2491@rowland.harvard.edu>
 <16e0db6c-a8b8-48f2-9164-c248664d053c@windriver.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16e0db6c-a8b8-48f2-9164-c248664d053c@windriver.com>

On Thu, Jul 30, 2026 at 05:27:32PM +0800, Lei, Xue wrote:
> How about the patch
> 0001-usb-gadget-f_mass_storage-defer-filp_open-to-workque.patch?
> 
> The deadlock fundamentally occurs because filp_open() executes in the same
> task context that holds sb_writers on the configfs superblock. Any
> path-based
> validation approach (rejecting relative paths, checking the target
> superblock after kern_path(), etc.) is inherently a heuristic — it tries to
> predict
> which paths would lead to the recursive lock acquisition and reject them
> upfront.
> 
> And this patch eliminates the problem at its root: by moving fsg_lun_open()
> to a worker thread, filp_open() runs in a context that simply does not
> hold sb_writers on any superblock. The recursive acquisition becomes
> impossible regardless of what path the user provides — relative, absolute,
> pointing to
> configfs, or anywhere else. There is no need for path validation heuristics
> or filesystem-type checks.
> 
> The trade-off is one additional context switch per file attribute write,
> which is negligible given that this is a configuration-time operation (not a
> data
> path), and fsg_lun_open() already performs blocking I/O (opening and
> validating a backing file).

Did you try testing the new patch?  While fsg_lun_open_deferred() is 
waiting for the completion, it still holds the sb_writers lock.  So 
fsg_lun_open_work_fn() will block waiting for the lock to be released, 
which will never happen because fsg_lun_open_work_fn() can't signal the 
completion until it finishes waiting.

I think there is no way to solve this problem (at least, not unless 
fsg_lun_open() returns before the file has actually been opened -- which 
would cause other problems), and the best we can do is warn people not 
to put the backing storage file in the configfs filesystem (which they 
shouldn't be doing anyway).

If you still believe this problem needs a better fix, perhaps the way to 
find a more suitable approach would be to ask the VFS filesystem people 
how to do what we want.

Alan Stern

> diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
> index 75831f2c7abe..c33591326086 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -21,9 +21,11 @@
>  
>  #include <linux/module.h>
>  #include <linux/blkdev.h>
> +#include <linux/completion.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
>  #include <linux/kstrtox.h>
> +#include <linux/workqueue.h>
>  #include <linux/usb/composite.h>
>  
>  #include "storage_common.h"
> @@ -176,6 +178,49 @@ void fsg_lun_close(struct fsg_lun *curlun)
>  }
>  EXPORT_SYMBOL_GPL(fsg_lun_close);
>  
> +/*
> + * When fsg_lun_open() is called from a configfs store handler, the calling
> + * task holds sb_writers on the configfs superblock (via vfs_write() ->
> + * file_start_write()).  If filp_open() inside fsg_lun_open() resolves the
> + * path to the same superblock, mnt_want_write() in path_openat() attempts
> + * to re-acquire sb_writers, which deadlocks against concurrent freeze_super().
> + *
> + * Deferring fsg_lun_open() to a workqueue worker ensures filp_open() runs in
> + * a context that does not hold any sb_writers, eliminating the deadlock
> + * regardless of the path provided.
> + */
> +struct fsg_lun_open_work {
> +	struct work_struct	work;
> +	struct completion	done;
> +	struct fsg_lun		*curlun;
> +	const char		*filename;
> +	int			result;
> +};
> +
> +static void fsg_lun_open_work_fn(struct work_struct *work)
> +{
> +	struct fsg_lun_open_work *ow =
> +		container_of(work, struct fsg_lun_open_work, work);
> +
> +	ow->result = fsg_lun_open(ow->curlun, ow->filename);
> +	complete(&ow->done);
> +}
> +
> +static int fsg_lun_open_deferred(struct fsg_lun *curlun, const char *filename)
> +{
> +	struct fsg_lun_open_work ow;
> +
> +	INIT_WORK_ONSTACK(&ow.work, fsg_lun_open_work_fn);
> +	init_completion(&ow.done);
> +	ow.curlun = curlun;
> +	ow.filename = filename;
> +	ow.result = -ETIMEDOUT;
> +	schedule_work(&ow.work);
> +	wait_for_completion(&ow.done);
> +	destroy_work_on_stack(&ow.work);
> +	return ow.result;
> +}
> +
>  int fsg_lun_open(struct fsg_lun *curlun, const char *filename)
>  {
>  	int				ro;
> @@ -451,8 +496,8 @@ ssize_t fsg_store_file(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  	/* Load new medium */
>  	down_write(filesem);
>  	if (count > 0 && buf[0]) {
> -		/* fsg_lun_open() will close existing file if any. */
> -		rc = fsg_lun_open(curlun, buf);
> +		/* Defer to workqueue to avoid sb_writers deadlock. */
> +		rc = fsg_lun_open_deferred(curlun, buf);
>  		if (rc == 0)
>  			curlun->unit_attention_data =
>  					SS_NOT_READY_TO_READY_TRANSITION;
> -- 
> 2.49.1
> 

