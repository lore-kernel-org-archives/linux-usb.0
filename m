Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950EF3B05AD
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325183; cv=none; b=eM1EZFdfasE6/vxhXCCDita0wzQ3ywF79+64Yoe3XKtkMNXp6IMg8ELGVgjmGyUflo4VjCwkuxx68H82BIdJX8oBtT0PsopcfLekYzl3qjJclis52C1BwHn+lOcyuIlnQzAe9uRn7SlGj2c1i5fTuUOql26fBSu4wU+rtLOR1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325183; c=relaxed/simple;
	bh=7PyrRMw9wW7xV59ftszCky4TbauN3P/DgotHc8GcRJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTtK6rSubwRebC1x9BlifWOlrJiXr8Eh7SuTDnB2daCP8Ap0ECPgnLOuIjwRxEN3OPnkG3J9Q8XqtRh9wT2scGWJrP1DBa4JhwamQ/66+Utxpgq2NsBVwJHaw94oTVNc1AJj6HVdIYkn1eXW6PXYrZpN0Z8z69h0SqcOxC/rQxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LI0hDo9I; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LI0hDo9I"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso19130356d6.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787325180; x=1787929980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BcMxKm5nDd1kF3AkEvyGfAsjqHkfBXm/NNZRhfLOvTU=;
        b=LI0hDo9IiOUAW8S6kepvUJEJE3TgNyDaXJhnA1cd/vKxsfeCX2KD+u+XBhaKjADS0n
         dd25ep8eRFjwCWWM9I6VPrdF1zCoPDydvMD+OT8R+YlQuK2yjtDKS1dKVEfcT24vF0Qi
         2+/34rvuKkwdrFZjZ2kHcNUnzt4791/suW8qI0OurV+6vIPoRsuPqxATUXVBYWVgl+IK
         hNqrhJnf6bJZtKZbGX7c8uM/QbQcLRSQWmIgSqhJob5giiDWZ8DQrNXW8aZPD09J3s8Z
         L8yXczZ2O6Gjjcod5cOVCNFWbnL3eamBIq2DBqv8nAKYkF6v69J4iTD3fnltM+2GOLZv
         R5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325180; x=1787929980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcMxKm5nDd1kF3AkEvyGfAsjqHkfBXm/NNZRhfLOvTU=;
        b=kWF5gxxehnR73qXTGy15pKOt73yt7cL+4xSkW6PLQEKh7cA6Nb/s1JeUywvsDYfJGw
         ae4r2JO1KYix5PVAY9p1iqQoHHFFe4l+4hnrIlC29jpO7MhJh+OhIpx7zV5OhkPyCI3J
         xTarf0PMx5sq/KCu6pcSgZlOhTL3wai+5tJCV3+O+tjzH9Dnsp4ID3lcvG4W5EMCkE6K
         WzqXNEhMblg39SP6DqDbSwb7a1PikVh3Q+F9PQo81ou+UuuQ021XBL7n8xvA1UT6G0m9
         +sr1AtcrsITQeVTmUj5qBAJj5uUxkya5loTaY7lc/H22o6Btxk8ZpZbrYPQtLXmyGel3
         pycQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfULwyY9yasW0/MOlBJvE3mfbsGQOSn9mHGG+n+nRdkhmKxYBJl/t6ePvsxxHpBRPIE+6YqyuEFl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfYQ5xtokXcjfT8OqsHDFzpVNw6ySnunbFGxZDkAc2JGm1/9G
	pzunJ70YP9X8nAMQMB30+eP/MPhzjfsZlfZAieOQakyk9OYkSVFNaXyE4JLFSbl+yg==
X-Gm-Gg: AR+sD11D3+4rxyEsD3zaLzhMlFOUQNHPFzPuicBI2RE7yp2U6tSrqghtQtQ36MBTxNd
	M4ESUWQ5fd55tNl0VPHMt/sD2Kbx3RKuZt9Nf2T4MLOAj9r39gA0blrsGdK8uV9cdaKrCc7ub7F
	pm5iu0EKdO8/12VkUmAvTgegtmF40JH+N97kMcTo8joPDYt8QPzW/JdW5oyTKPL5ie29q4TNRKD
	BCzi7eoujgTU44w4/lX1v7FNTpY7oBYoIvDp+tVcdn+tWhbqSdwNFC+SCr4fz4Stf7i0xvh12V9
	OtDUJLFV4mhtI1fvl8fGFX82XkpLP2h2WLJN78LC5lnkJaY9ur+uFDS1aV8SRwgdzUSJlQLwilx
	BELFKSDFPhzgmOE9qSZI8BOkRE15SyVJ9SOJK6uS2hS10ltITMNse8dFhiLhLgxUgnoi5GsH5dx
	HsJZ5CYwjAFxUzu68HRZ5GahFxCBJgITVQ+usDUnQYQKse/xB2tG7E/CDqHOITxA==
X-Received: by 2002:a05:6214:2f0c:b0:907:bf1e:f888 with SMTP id 6a1803df08f44-90c6ac0dab2mr151739786d6.17.1787325178792;
        Fri, 21 Aug 2026 08:12:58 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2905d6sm64457626d6.29.2026.08.21.08.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:12:58 -0700 (PDT)
Date: Fri, 21 Aug 2026 11:12:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Liu Qi <liuqi@longcheer.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+22ea20ef3afb6785b122@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb-storage: ene_ub6250: fix race between scan work
 and probe
Message-ID: <586aa82d-73c8-4cf7-ae74-4568f97f68db@rowland.harvard.edu>
References: <20260821090416.1247127-1-liuqi@longcheer.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821090416.1247127-1-liuqi@longcheer.com>

On Fri, Aug 21, 2026 at 05:04:16PM +0800, Liu Qi wrote:
> ene_ub6250_probe() calls usb_stor_probe2(), which starts the usb-storage
> infrastructure and schedules the delayed scan work.  The driver then
> calls ene_get_card_type(), which sends an ENE command through
> ene_send_scsi_cmd() and the usb-storage bulk transfer helpers.
> 
> Both the delayed scan work, through usb_stor_Bulk_max_lun(), and
> ene_get_card_type() use us->current_urb.  The scan work serializes this
> access with us->dev_mutex, but the ENE card-type probe does not.  If the
> scan work runs while ene_get_card_type() is still using us->current_urb,
> usb_submit_urb() warns that the URB is already active.
> 
> Serialize ene_get_card_type() with us->dev_mutex, matching the locking
> used by the scan path.
> 
> Reported-by: syzbot+22ea20ef3afb6785b122@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=22ea20ef3afb6785b122
> Assisted-by: Qwen:Qwen3.6
> Signed-off-by: Liu Qi <liuqi@longcheer.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/ene_ub6250.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
> index 2cffc559a..13b332d1d 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -2358,7 +2358,9 @@ static int ene_ub6250_probe(struct usb_interface *intf,
>  		return result;
>  
>  	/* probe card type */
> +	mutex_lock(&us->dev_mutex);
>  	result = ene_get_card_type(us, REG_CARD_STATUS, info->bbuf);
> +	mutex_unlock(&us->dev_mutex);
>  	if (result != USB_STOR_XFER_GOOD) {
>  		usb_stor_disconnect(intf);
>  		return USB_STOR_TRANSPORT_ERROR;
> -- 
> 2.43.0
