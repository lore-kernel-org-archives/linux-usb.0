Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236A47DD66
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435270; cv=none; b=k26dqy8hkQCmGkrwAJ1aHYXwfL4ppzrZG0ehvGC+7kk+BTE/+lUBqYQAzBTaqKT5iwGLcMQGWtm/pnweY++WwQUnp+p598PqXiT7mXZbV/GCTKbmPxxg9J6wY6eHUSoYfXZVakylawL3zmi71lCYvND0TWF/+ETcTKLzbjQIuKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435270; c=relaxed/simple;
	bh=8gu6P8N+v/Vvw+My6H2ERJDqHQ1Ck9J6Mbe3CbcKwlE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnN2FxYl0rx/aFR3aR/iMnU1T+8W+fFksZIW7XdJVIg/hLJTwPJCM258d9ZLVd1FLM2eaN43uQDEmhdO/8pz/6Xk8ND0hwWSsxDBKchkME5yhG2hW8eBfZy5rhuYJR217nkxYkpGJv19uTxgfzt3YwGjIfebZvXTfXtJ/c0ncSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVqe0eWF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVqe0eWF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b9320423cso22527705e9.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 04:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788435253; x=1789040053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geLMceXZKvAsoq7yccAMfzX5cuhvjtXWXS2+/P3v3EE=;
        b=sVqe0eWFNXrjnh4dpCxpf5YYvfRf7v9PtoV0gr3jXi80MNZmsrHigGjdkgiGyXGz0N
         z3ltepE9ksF/L0big3m9BZ0f8CnHTt14zzmcyo7NLWeYeXuBikmnRY9pMokce7G9VlTn
         eV9tnHENP8X94EBFgiiyVh+fk/q36X1tSvpO7BET7IpHZy7PIB5KmbGOcdm/lsyeo6ZX
         xFT1sGi2+f5GCgeybYp/xi3mg3vGUo/lAZvdAh7lQJ+8QqU7Ab/0/wWgs4291rkX4Pva
         zteZ7tuIAzE0qemdLXoUNMxFO1+wbLTRsco3QbT8cTuzufyVKaqpIcuRwqiAEhSa/EJr
         +K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435253; x=1789040053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geLMceXZKvAsoq7yccAMfzX5cuhvjtXWXS2+/P3v3EE=;
        b=kcG862oAIOD0auSVYMjmxXZUqBxVPB1ZYmbFFmPXNCW7mtWPcYa3IfphATUY1fTvm2
         iLww6nWWY1ZjLHxWFk/yAb1uIG5snS/rkD0byAiFvyrzXNLdcs5CakJSk1K/nlFoqSyd
         yvjuU5t2QpRGzpaGOU8Qjr/R2apALo9RWHwCuf+fBBa4Gt0rRGEJG0kD/vKbx+ohZ0hO
         //f/CYjVTAnzKXnnNNb7eumZ7Xi8C4GsBQxe9CHtxxTJSsGkE7Y3Ph7XmvZtwOlRP11C
         EvG6AWBLKMJzhqIkyM8CQS1Jbe8ukztuTFiI9z6ZMl6cTzDDQKbFaLBgw48o1v1nJik6
         iz7w==
X-Forwarded-Encrypted: i=1; AKwUvByNFsv1GvrVELG7JQVny4xGYo8kVkkrec5aFGmX/ThYYtskgIUAeGxKdrMGJMsuYO2BH6jS/plwx+A=@vger.kernel.org
X-Gm-Message-State: AFuF++l/MnWNuqfJNmT+2zqJEX1mM3/8QP9Mp/TUO/Xry0Fndn4571er
	JypZdaADbkPB4EOyr599ohUR3ZBnElsUNExmg8am6rWIFMTmFRl2v9MB
X-Gm-Gg: AYBFou3rLOGdO/6aZToRGDBP1IuFKkNrkw+ouEvmitHtHx55Iu7rlkGG3dClxeJ7pFZ
	N/NQQOjA+e1RPy/aEXSM/q0fJ6Q6lfiHjABXiwnWclDx6IAMtJGm1PldhDXj5S4RWj1NH/S8C8C
	Pbboe26eUUBJxdFd5B5ot7PVbD/LSa0c6Pa6BIu/vsBwVKVflRTuYTLJCvsq5ePtGqCCxg6l60s
	7d5P6xd1P8zrHJz69T5cz+y9aqswh++EzDQtGXEi2F7g4LyuBz8IOs5mwdK3zMJOZl3ov88WOR5
	YguQWeT/s4P7cBVUM3zsqE7ToV3zGJ4zpIPLAQab6pGtoS/+K5+Y9xLTf6RCGagdeeMN+WNmPmW
	wxgwvTOmVGXOffZZd7Js/QA4TLmU37hpIHawKsyWRCy0b2/dGKI5j9usVTkcDPYIX7aRL3zJHcN
	EQugBhCCXcStmCIMEBriac6pywpVPa47HDnqoe4pe6eEBi/uSL/0ukULlzIzB91ud4hH8wMg==
X-Received: by 2002:a05:600c:699b:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49ce584c6femr210966645e9.15.1788435252782;
        Thu, 03 Sep 2026 04:34:12 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dadddsm75695255e9.9.2026.09.03.04.34.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Sep 2026 04:34:12 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:34:08 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Edward Adam Davis <eadavis@sina.com>
Cc: daniel@caiaq.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org, perex@perex.cz,
 syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, tiwai@suse.de,
 zonque@gmail.com
Subject: Re: [PATCH v2] ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
Message-ID: <20260903133408.7da4c35f.michal.pecio@gmail.com>
In-Reply-To: <20260903100410.541828-1-eadavis@sina.com>
References: <20260903094105.539519-1-eadavis@sina.com>
	<20260903100410.541828-1-eadavis@sina.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 18:04:10 +0800, Edward Adam Davis wrote:
> The epq_in_urb object belonging to the caiaq device is coupled within
> the struct snd_usb_caiaqdev. After usb_submit_urb(epq_in_urb, GFP_KERNEL)
> executes successfully, epq_in_urb is successfully added to the urbp_list
> queue of the dummy HCD driver (userspace specifies dummy_hcd as the HCD
> layer driver for the caiaq USB device).

Sounds like an irrelevant detail. Same crash would happen with any HCD.
 
> When init_card() calls snd_usb_caiaq_send_command() which subsequently
> fails due to a timeout, and proceeds to call snd_card_free() to release
> the card, the embedded ep1_in_urb object is also freed. When the dummy
> HCD driver detects that the URB has been unlinked, it returns the URB
> (by usb_hcd_giveback_urb()), which triggers [1].
> 
> Decouple the ep1_in_urb object from the struct snd_usb_caiaqdev and switch
> to using a pointer instead. Separately allocate and manage the memory for
> ep1_in_urb to prevent the release of the snd_card memory object from
> interfering with it.
> 
> midi_out_urb has the same issue as ep1_in_urb and is handled in the same
> way.
> 
> [1]
> BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
> Call Trace:
>  usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
>  dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
>  __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
>  __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
>  hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
> 
> Allocated by task 36:
>  snd_card_new+0x7b/0x110 sound/core/init.c:184
>  create_card sound/usb/caiaq/device.c:429 [inline]
>  snd_probe+0x236/0x1af0 sound/usb/caiaq/device.c:544
> 
> Freed by task 36:
>  snd_card_free_when_closed sound/core/init.c:630 [inline]
>  snd_card_free+0x138/0x1d0 sound/core/init.c:662
>  snd_probe+0x162b/0x1af0 sound/usb/caiaq/device.c:553
>  
> Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
> Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
> Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---

Does this submission comply with the rules here?
https://docs.kernel.org/process/coding-assistants.html

> v1 -> v2: same dealwith midi_out_urb and add missing check
> 
>  sound/usb/caiaq/device.c | 39 +++++++++++++++++++++++++++------------
>  sound/usb/caiaq/device.h |  4 ++--
>  sound/usb/caiaq/midi.c   |  6 +++---
>  3 files changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
> index a16e59248480..d0fe954b8133 100644
> --- a/sound/usb/caiaq/device.c
> +++ b/sound/usb/caiaq/device.c
> @@ -192,8 +192,8 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
>  		break;
>  	}
>  
> -	cdev->ep1_in_urb.actual_length = 0;
> -	ret = usb_submit_urb(&cdev->ep1_in_urb, GFP_ATOMIC);
> +	cdev->ep1_in_urb->actual_length = 0;

That's one of the first things usb_submit_urb() below would do,
and has done since forever.

> +	ret = usb_submit_urb(cdev->ep1_in_urb, GFP_ATOMIC);
>  	if (ret < 0)
>  		dev_err(dev, "unable to submit urb. OOM!?\n");
>  }
> @@ -408,6 +408,10 @@ static void card_free(struct snd_card *card)
>  #endif
>  	snd_usb_caiaq_audio_free(cdev);
>  	usb_put_dev(cdev->chip.dev);
> +	usb_free_urb(cdev->ep1_in_urb);
> +	cdev->ep1_in_urb = NULL;
> +	usb_free_urb(cdev->midi_out_urb);
> +	cdev->midi_out_urb = NULL;

Is clearing this necessary? (I'm not familiar with ALSA)

>  }
>  
>  static int create_card(struct usb_device *usb_dev,
> @@ -457,22 +461,33 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
>  		return -EIO;
>  	}
>  
> -	usb_init_urb(&cdev->ep1_in_urb);
> -	usb_init_urb(&cdev->midi_out_urb);
> +	cdev->ep1_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!cdev->ep1_in_urb) {
> +		dev_err(dev, "alloc ep1_in_urb failed.\n");

AFAIK logging on allocation failure is frowned upon.

> +		return -ENOMEM;
> +	}
> +	cdev->midi_out_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!cdev->midi_out_urb) {
> +		usb_free_urb(cdev->ep1_in_urb);
> +		dev_err(dev, "alloc midi_out_urb failed.\n");
> +		return -ENOMEM;
> +	}
> +	usb_init_urb(cdev->ep1_in_urb);
> +	usb_init_urb(cdev->midi_out_urb);

And what would be the point of that?

>  
> -	usb_fill_bulk_urb(&cdev->ep1_in_urb, usb_dev,
> +	usb_fill_bulk_urb(cdev->ep1_in_urb, usb_dev,
>  			  usb_rcvbulkpipe(usb_dev, 0x1),
>  			  cdev->ep1_in_buf, EP1_BUFSIZE,
>  			  usb_ep1_command_reply_dispatch, cdev);
>  
> -	usb_fill_bulk_urb(&cdev->midi_out_urb, usb_dev,
> +	usb_fill_bulk_urb(cdev->midi_out_urb, usb_dev,
>  			  usb_sndbulkpipe(usb_dev, 0x1),
>  			  cdev->midi_out_buf, EP1_BUFSIZE,
>  			  snd_usb_caiaq_midi_output_done, cdev);
>  
>  	/* sanity checks of EPs before actually submitting */
> -	if (usb_urb_ep_type_check(&cdev->ep1_in_urb) ||
> -	    usb_urb_ep_type_check(&cdev->midi_out_urb)) {
> +	if (usb_urb_ep_type_check(cdev->ep1_in_urb) ||
> +	    usb_urb_ep_type_check(cdev->midi_out_urb)) {
>  		dev_err(dev, "invalid EPs\n");
>  		return -EINVAL;
>  	}
> @@ -480,7 +495,7 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
>  	init_waitqueue_head(&cdev->ep1_wait_queue);
>  	init_waitqueue_head(&cdev->prepare_wait_queue);
>  
> -	if (usb_submit_urb(&cdev->ep1_in_urb, GFP_KERNEL) != 0)
> +	if (usb_submit_urb(cdev->ep1_in_urb, GFP_KERNEL) != 0)
>  		return -EIO;
>  
>  	err = snd_usb_caiaq_send_command(cdev, EP1_CMD_GET_DEVICE_INFO, NULL, 0);
> @@ -530,7 +545,7 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
>  	return 0;
>  
>   err_kill_urb:
> -	usb_kill_urb(&cdev->ep1_in_urb);
> +	usb_kill_urb(cdev->ep1_in_urb);
>  	return err;
>  }
>  
> @@ -576,8 +591,8 @@ static void snd_disconnect(struct usb_interface *intf)
>  #endif
>  	snd_usb_caiaq_audio_disconnect(cdev);
>  
> -	usb_kill_urb(&cdev->ep1_in_urb);
> -	usb_kill_urb(&cdev->midi_out_urb);
> +	usb_kill_urb(cdev->ep1_in_urb);
> +	usb_kill_urb(cdev->midi_out_urb);
>  
>  	snd_card_free_when_closed(card);
>  }
> diff --git a/sound/usb/caiaq/device.h b/sound/usb/caiaq/device.h
> index 743eb0387b5f..1c6f34693fa8 100644
> --- a/sound/usb/caiaq/device.h
> +++ b/sound/usb/caiaq/device.h
> @@ -60,8 +60,8 @@ struct snd_usb_caiaq_cb_info;
>  struct snd_usb_caiaqdev {
>  	struct snd_usb_audio chip;
>  
> -	struct urb ep1_in_urb;
> -	struct urb midi_out_urb;
> +	struct urb *ep1_in_urb;
> +	struct urb *midi_out_urb;
>  	struct urb **data_urbs_in;
>  	struct urb **data_urbs_out;
>  	struct snd_usb_caiaq_cb_info *data_cb_info;
> diff --git a/sound/usb/caiaq/midi.c b/sound/usb/caiaq/midi.c
> index c656d0162432..18529484c8dc 100644
> --- a/sound/usb/caiaq/midi.c
> +++ b/sound/usb/caiaq/midi.c
> @@ -43,7 +43,7 @@ static int snd_usb_caiaq_midi_output_close(struct snd_rawmidi_substream *substre
>  {
>  	struct snd_usb_caiaqdev *cdev = substream->rmidi->private_data;
>  	if (cdev->midi_out_active) {
> -		usb_kill_urb(&cdev->midi_out_urb);
> +		usb_kill_urb(cdev->midi_out_urb);
>  		cdev->midi_out_active = 0;
>  	}
>  	return 0;
> @@ -64,9 +64,9 @@ static void snd_usb_caiaq_midi_send(struct snd_usb_caiaqdev *cdev,
>  		return;
>  
>  	cdev->midi_out_buf[2] = len;
> -	cdev->midi_out_urb.transfer_buffer_length = len+3;
> +	cdev->midi_out_urb->transfer_buffer_length = len+3;
>  
> -	ret = usb_submit_urb(&cdev->midi_out_urb, GFP_ATOMIC);
> +	ret = usb_submit_urb(cdev->midi_out_urb, GFP_ATOMIC);
>  	if (ret < 0)
>  		dev_err(dev,
>  			"snd_usb_caiaq_midi_send(%p): usb_submit_urb() failed,"
> -- 
> 2.43.0
> 
