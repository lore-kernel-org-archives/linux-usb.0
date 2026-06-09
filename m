Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E3A4A13B9
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020530; cv=none; b=Ia2BxmMMQ8UdbsgxkCq2lm3aPS8ZHKieeeqTvtPlCvDBU8mmgQq+2SG57sWsHsAKEmcUh8mFglMDuX3t+KlL8y6owwQF+zYHKo1EUOOI4uBOf7ppRewh8t4oHkLamYzvjUmq7OIarJwhLDaBQEEBywjdYrVGtlZk1nzAz7sIYSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020530; c=relaxed/simple;
	bh=vnzgr0wZPYhLyjo5iZwwLgQCFNkCGyM2OhRSkb9N97g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=TerpaChXlN6LsmVE5CjxXc2muiEfjuKaYnXUV7LalconlGhdj+VJEMce+kz6QBi8b5imgHuiFr+IwsefIZ8TVxzli/Mw+IylqVMEtc/zB5IiShtABFSLg4yHS9XTZJJFGRelHtDycPsUKczrmeMlfXCYMNvi9gN/qY4FOXv3juc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpYp8CBZ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpYp8CBZ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51778077b28so64205101cf.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Jun 2026 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781020527; x=1781625327; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlG8N3aHvqiInm0r0TgXUpGKex3pN7HDqaGpiUSCyGs=;
        b=jpYp8CBZ8J1SSsOKiagoX0eZ3Vh8oI0ECEU4ijtaP4UwYEq6a3+8jkkMN1kHNpihXL
         uiVXnp6HKUUnMoeFm8OR2B1dKa73mRxRNKx6ZOGIPwmTcs+tJl7/3PxZc2p05zIvtS3C
         ik6yH97fjVazoHYf9DFlmQE41b1qcoyQ2Hyef9n9M6itydXDlhDS8LbZ/rjz1kzcs5zy
         FuPgP2WHDcrRjQp4JxbHqoSdNRkf7aVnvJQfd0hRQOZDRXtyZHBMikVeNbd+z/VAWTRr
         2bBXCCfmYCNkXGwtE7BKIAw+za1u3zRsc2aO1bA33GkUZZDL+n2qwtpY9a9fHLoEOT0k
         USsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020527; x=1781625327;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlG8N3aHvqiInm0r0TgXUpGKex3pN7HDqaGpiUSCyGs=;
        b=tBGcgnlSSa5KWk+wX6wrremcPPLARrk/JV45guCXdPiOLlqy/2CZAuh+KOH8c58AHu
         AAVA2F93EXP3p1/aEgvDI+b7HFSBfuazwqfWFesrzRu1rf1NwgreUEzGQNL+wTLqkFVT
         iG4BZG0Z8J39wUMdb/NnraQ7qFOUkfJyRPTNGXufHjRlTrrqZyzP4y9lFtMPQSSdvHbh
         9lAXIxh/tYEiEkyDz2xKOebN5fDuiXl2uj65VQQYJpkak2F1hwGvorQ+fpPVfQOMyo7I
         dNLfJ75o4qN5yUBTOu1GalHqIp4Rf9DiucseK5fhqYpnOTTOQEOMGgd9WOxhSX/lnUYJ
         C27Q==
X-Forwarded-Encrypted: i=1; AFNElJ9u331u/6Uq502XWQ3YS+nJCddNBc4EjkzrPcf1WRFaHETN//NvZTR4Hhq5Fq5KlRD9Px3AljxMq6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN5LKQGOZySDLv0PlQaGwS9uU7f/C7VFs0KE6D1920ybAWuTGw
	mzRdZxzUsmcb0bgVj+Fy6wciPhqnAE4KDVEUAkkE3/dkL3WvVUZfx3Sg
X-Gm-Gg: Acq92OFkszSpfX1FQ/wUmNpKsV0BnIAWr9rUYZr+cWF+YOlFl8Kakckg7TDis0r/BXD
	q3q9ppQH8k4Ulm6XTrPVx1j6AZPamLZD0l1eupE7xW8pul/Q0IGOfx/TldwiSnxgiQZG7mKoWF9
	CW1nrXIQdejyAxprDXnFTWVxXxrZPBt5uxc5Soj+vBkKrQXCBEv3XK4T6k7+d272YG7GpkRzw6R
	ZbbHJ4Iyat9L52VgH7hplintxck8rvfiphDio/lTDgC6ogc2Zm+0GHPct/JZtePAafzLHHi5oeA
	dXznLUW7PZADkaoQdN7O7vyG2hhO/TkksH/uy1rJyWrycKfAqQ+KSHzwxh7303Ih6yFiLONpUR5
	T/Vab6vXvJWuWfYd0CA1a8iXKY73Yc6TobMkaqPOzydQM+zsXZ8o5d/nvBNCufHdzRp+bK/YYZU
	Ucd5lgIwX2BF8iVZTs+mBH5z0c/PWdhAQoRSquV+JcUR+GM8M2ycTvktRRPFmZMSV/o1AXRa2Fx
	VM=
X-Received: by 2002:a05:622a:2517:b0:517:5e32:af23 with SMTP id d75a77b69052e-51795aebe02mr319216941cf.23.1781020527242;
        Tue, 09 Jun 2026 08:55:27 -0700 (PDT)
Received: from smtpclient.apple ([2601:985:4601:5df0:d13d:e392:6196:91d4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07eb0sm207572981cf.5.2026.06.09.08.55.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:55:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <0085d585-c3e8-455f-9959-b019800f08ea@rowland.harvard.edu>
Date: Tue, 9 Jun 2026 11:54:55 -0400
Cc: Johan Hovold <johan@kernel.org>,
 Oliver Neukum <oneukum@suse.com>,
 keithp@keithp.com,
 gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <99E24BBC-33EF-4B4C-96E6-1FAF4F65C8D8@gmail.com>
References: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
 <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
 <2a50158f-34ff-41ae-8899-ba2ec6d550b3@suse.com>
 <67613cb1-acaa-4870-93ed-95a282a74f06@rowland.harvard.edu>
 <aibbn1858ZUIq6Fq@hovoldconsulting.com>
 <0085d585-c3e8-455f-9959-b019800f08ea@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Jun 8, 2026, at 12:03, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> On Mon, Jun 08, 2026 at 05:11:27PM +0200, Johan Hovold wrote:
>> On Mon, Jun 08, 2026 at 09:29:23AM -0400, Alan Stern wrote:
>> 
>>> You're partly right.  Both my original patch and yours ignored the fact 
>>> that the driver takes a reference to the interface structure.  That 
>>> reference isn't dropped until chaoskey_free() runs, so the only 
>>> debugging statements that need to be removed are the ones following 
>>> calls to chaoskey_free().
>> 
>>> Index: usb-devel/drivers/usb/misc/chaoskey.c
>>> ===================================================================
>>> --- usb-devel.orig/drivers/usb/misc/chaoskey.c
>>> +++ usb-devel/drivers/usb/misc/chaoskey.c
>>> @@ -248,7 +248,6 @@ static void chaoskey_disconnect(struct u
>>> mutex_unlock(&dev->lock);
>>> 
>>> mutex_unlock(&chaoskey_list_lock);
>>> - usb_dbg(interface, "disconnect done");
>> 
>> There is no need to remove this one as driver core holds a reference to
>> the interface until after disconnect() returns.
> 
> Yes, you're right of course.  And I'm annoyed, because I had realized 
> exactly the same thing before noticing the usb_get_intf() and 
> usb_put_intf() calls, and then forgot about it when updating the patch!
> 
> The final version of the patch is below.
> 
> Alan Stern
> 

I tested this patch. It works on my side. Thank you!

> 
> Index: usb-devel/drivers/usb/misc/chaoskey.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/misc/chaoskey.c
> +++ usb-devel/drivers/usb/misc/chaoskey.c
> @@ -320,7 +320,6 @@ bail:
> mutex_unlock(&dev->lock);
> destruction:
> mutex_unlock(&chaoskey_list_lock);
> - usb_dbg(interface, "release success");
> return rv;
> }


