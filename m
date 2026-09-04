Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC241CB5E
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540652; cv=none; b=e8NTe6+SkBLte+M+KHff0LONE/g9iqXGKJtb6yNAtqKu2GasxuM+t767RbHXPzVe8UFV6P31u8aN2fvJfleFxVoyT/IC3UPemsWxfHasFzhxUI6mp3JLC3UsTeK1YtHol2eKypeBHC/qb0yv96WLPsjmNhjkGAXL4XA9eYDABgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540652; c=relaxed/simple;
	bh=gFzhoXy6DMu00ZWahp5gqICmE7NrEFasFfKr+nl6yY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNXBEVTehtUQI8QNNi8SSdQQ0Frjy72G/I8RGnlpk2hwJl0CjFNHEun+2opg8UGq/Umu5I9bhHRRSLfIk+e5te8KpbtUPGJ6jyw5gpNlk8S8PjGWco7F5y9+GbAy+YZT92gg4RTGil5KggwL9QHvwkK1Bu2n+50lAX39hkaowow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FOjuoWD1; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FOjuoWD1"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90e92b99ab9so7951986d6.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540650; x=1789145450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63K4WdssmxM1QOyhbdav4K7X3rq9bXpABh3iv2kYGDA=;
        b=FOjuoWD1gCx87/YzEF/ox9hNlapFV2qg78tmSeJDx4bX36AB6ZyGgGTeQ/w4mMNmuL
         vbhuIA+p0/hVcWKYxHtVNKHoR+c5ffLExP7C9kMnFBUTWdqWU3b9MIUbPZqyem6MLV5Z
         A+tcqBLTjK8GmJk5T0pX2PiE5k+vLsvBAeFwNj2pD/cYRWEu8vPjZwse9meWrek5dbx1
         lxjcKeaqtgLlOcxBlTQaXSvfXO177YKJTPwSJH/Zs232bnF2Fshk7YEWqrchv1bWbnQd
         M8ADeCDsNARzvt5HT3HxNdp/I0GQBVfX/l+6MRhFNSHrBNQnPC6cItEt/uh8u5+U0RS2
         wj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540650; x=1789145450;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63K4WdssmxM1QOyhbdav4K7X3rq9bXpABh3iv2kYGDA=;
        b=Qo6plKXrUBrWJ7yfqabIazbJzxmppw9hzMNEjGDbS6MB7IzNbT4pxdc4Vixy3o1XLD
         PrG8OMA35yCjP2rLWxt8y7Hs68O7gm47QixOhIe5qF4ZrfyU70RX6NIycACXbaYUYA+n
         RZ3f9gcx9DFyMOd/4dmus8ODp3HaYRclvDsdh5I8BCenXD0KODFY6ri35GvYxS4GNdzM
         QMHFCDXqVmssk7nphleW9DtrYIGmh+knYbpfg9I5lPbqD5UImoUGNW/y2HXQZZjJxFBI
         NybELouBkNcf4gMSYGdoide1jP4vpciNUkbMkDwlblccn13lGOJRI9AxzRPWtEuNn6Xb
         2AHg==
X-Forwarded-Encrypted: i=1; AKwUvBxF1U70TBvDeyGuzAhm2eLcyHoKJLVW0ebngmcwKeQ2N4ueW5c2xODrwE3ITQkamv8LcERgVnTKW0c=@vger.kernel.org
X-Gm-Message-State: AFuF++leFfHN1ij/VRbEfIoZYqJuQTnPcPR6TqFCO/NXJkpmnZC66yBG
	htW24cvVwjSSbbrnMCOZsjMLWemGtp/04+BXzP7q0RrDN41jXDpyX2ieFsQqTI41+w==
X-Gm-Gg: AYBFou1bVImCEGC3lqogGRchcZPjcTm1c7mYNAExrg6Wr1YrH0Mv5nPIdOE+HpW1Rb2
	TDBvH3CbtAkE5e0Re+1FT2ySUWyj+GHhhqDB+XlUaQxmVjXw3oC6J/E6e8BJQJyaBIZ1HwopDsM
	x1XJQVHz86AQyIv49avlrL0sZmAIzWns7j1hIdKOIxVKkPRh25/TWm41njMb4ZCqvSAn4BWKf4e
	X5zatpr2LyRtdgpJW5H3/udO6J7i/Ve52AoJ+lpmlySIiF1H36QcFVupnt1lmYDINobyiGBSDfA
	6jN/3Z9kbARt8YZJAHfg8JR9Gq8m0Y26ZuhPcBfiI+/4JW7Yl06XCKk8cVFCHQ3FEbzIc7zolD7
	Z8KLe2pouOQ16ZQs8axREqPRY4VMOZlW9lYnnHMU6w81oHwGlr7vAINdlZMZf9RJcanhJFnwNj9
	ESrZ/puF38bkDopAMyyq1I5bSqZ6DBWF7mDuD1C46WdU7jjyDAUpjLLm4nn0CELQ==
X-Received: by 2002:a05:6214:844c:b0:910:3455:53bc with SMTP id 6a1803df08f44-9103efe264amr59537296d6.34.1788540649512;
        Fri, 04 Sep 2026 09:50:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm25313236d6.25.2026.09.04.09.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:50:48 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:50:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Adriano Cordova <adrianox@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/1] usb: gadget: inode: fix use-after-free of struct
 ep_data
Message-ID: <0738d3db-3861-4eb5-9847-bde865a1bb28@rowland.harvard.edu>
References: <20260904163827.216389-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904163827.216389-1-adrianox@gmail.com>

On Fri, Sep 04, 2026 at 12:38:27PM -0400, Adriano Cordova wrote:
> gadgetfs_unbind() -> destroy_ep_files() frees each struct ep_data via
> put_ep(), but the inode still points at that ep_data through ->i_private
> with no reference of its own.  A concurrent openat() on an endpoint file
> can therefore reach ep_open() and dereference the freed ep_data (the
> mutex fast path), even while the inode outlives it.
> 
> Give the inode its own reference: take get_ep() when the endpoint inode
> is created and drop it again from a new gadgetfs_evict_inode(), so an
> ep_data can never be freed while any inode still points at it.  This is
> also safe against dcache pruning, since the inode reference keeps the
> count >= 1 until the endpoint is removed from dev->epfiles.
> 
> Reported-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
> Tested-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
> Signed-off-by: Adriano Cordova <adrianox@gmail.com>
> ---

A similar, but not identical, patch to fix this problem was submitted 
some time ago:

https://lore.kernel.org/linux-usb/ee41fbfd-f368-4a06-95d6-ae9b4267fd82@mail.kernel.org/

Alan Stern

>  drivers/usb/gadget/legacy/inode.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index db961aaa3740..089fa7119922 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1626,6 +1626,8 @@ static int activate_ep_files (struct dev_data *dev)
>  		if (!data->req)
>  			goto enomem1;
>  
> +		/* The inode keeps this ep_data alive via ->i_private. */
> +		get_ep(data);
>  		err = gadgetfs_create_file (dev->sb, data->name,
>  				data, &ep_io_operations);
>  		if (err)
> @@ -2015,9 +2017,20 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
>  	return 0;
>  }
>  
> +static void gadgetfs_evict_inode(struct inode *inode)
> +{
> +	/* EP inodes hold the reference on their ep_data via ->i_private. */
> +	if (inode->i_fop == &ep_io_operations)
> +		put_ep(inode->i_private);
> +
> +	truncate_inode_pages_final(&inode->i_data);
> +	clear_inode(inode);
> +}
> +
>  static const struct super_operations gadget_fs_operations = {
>  	.statfs =	simple_statfs,
>  	.drop_inode =	inode_just_drop,
> +	.evict_inode =	gadgetfs_evict_inode,
>  };
>  
>  static int
> -- 
> 2.51.0
> 
> 
