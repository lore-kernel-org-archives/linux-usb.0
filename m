Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FDE4028D9
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040475; cv=none; b=Uvns5bWnNsESGY862nWqNTnAYkaZ+SKqF8ER0zjjJBdE7b381vN4Df71K4exIv4N6TLYkDWxG8FzpByaIgYU8bVbEj+2M7KBAyaDM2BrQ56Q+JuQ4USE21ObC+b3gjJFkw21PAp/nF21yLv3zzO9I/q7BHC+SRzR5gWtUEQwluk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040475; c=relaxed/simple;
	bh=oJCfBaTSQIZpbF5vKTY33JS5U9keEEdkATL/oBuYNMg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHFAMyAzfepG1Be5PSZEtIqG/9ryvC/df23MxbZa6apTNzEPBfWJ8NNc1MZWhdpWfiqXqpZzKcCXfgiawBdnA9Ms2pPqk8mdKmjeb1oC8PncaTJ0nf4JeqATpQlg9/po0lGk/ovLQzyyxHpyvgTS1koJzXOt1/e2c5TgG4c6WrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOFXkQLi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOFXkQLi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso43102615e9.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040472; x=1787645272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yEoq8vSuunfu8k8FBwHonNB2QsdVF14waMnkaLWtmh8=;
        b=iOFXkQLiGSJThQ4n/lXeCRvt5WssWFtxW5WGC4nkaB90+yfbSkcP7xO2xlAOImEFuq
         WjK36ajyxv4WdBTOFJ6/+6i4CuPxJHdl+0GY3r+76mslasy/kgYyaZWSTtLaBylFz4dr
         xkw8fisGt4R++YpWThxQs4rpX2KZ/23Adc1EezYzqOkdCxIr4J7Qh78i6G4l8iBAjvD/
         BmPEH7NKHgLem92Pp4+Z1LGPIqhYDON/jh9V1DNM1cPTKoZ/L/+mvj/AoPetHwODrOb2
         L9lXg2SyIGwRQLwbsCOZMzfTZ232oL8Zo2uonJUyTL5f2tDBUw4vt4nmVRLy/9XGdpJa
         T8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040472; x=1787645272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEoq8vSuunfu8k8FBwHonNB2QsdVF14waMnkaLWtmh8=;
        b=likMWBzSSsT6uMRxXLBUxvrFjf5xmxTbi2vmnAd22MMifxdNm3B0Ewxom9i1xLT2ld
         TVP1+OOjKTOrtInIViq0nq0e6ADLwdLQTG6y65R0bjs/RQ97WNsDK7jbcdAeI+lUgAYB
         9Lq07KD9xCgR/pNhFpnUtCYtO6gJJPZ8zxInIxscP12VblcX4W8r7KkGuI2kuGpTrlBB
         7iYHg7WYSojd5PbMiw0QTJy0UxDJW+hpagLEnvC2WTvKjxi6O41lbTf8A//JJorLLS8/
         5VMNFqx7+udT7sXJ11vV25iTMI1LN8mnd+8WdSQ8czoE+Bu0Dr9j2wi8qQGqTC9LUqE9
         SsFA==
X-Forwarded-Encrypted: i=1; AHgh+RqTnH5moj17bJbRWxsHnGJJfvgV05gg+AuGA+F6j2aP6nVJ1BBp19y0RNuLsiQ4hXoLZTIv7QaM/j0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4I5yS3zLHGUTXv4awvJVJGDMgJzP1ZSK1520cZsLyWtYdmg8
	NFFCIyLNa6b3wljTC4IIpg9xinu4iBxEtwlipEHz2TNVQ5bxQtYu49GC+KYmZEEj
X-Gm-Gg: AR+sD12QdWKVxHoL2X7Cjy8ErXYAKlTlQgQmoGm+1nkMVlj387HkRB4N+R+aSre8hKi
	7ERH9hk7abfs17bKR4RFMjpgqfqKzey8ywYvSaZpAmUHeM1mh4OoSLTBRCVVilyBwoksqDXKP//
	fuEG3Exf9jxHSKrs+Q89XaJ97heAQgL92sZfIA2rSzi9nuZdFh66g20dfUgqncRACpqKoM+UtGu
	K44bX4gXj6ek+YHcomzYGdt2BC/lKqu31tsrOg63UaYnNE6QFS4lR7e1ZBKj1gtqP8H/c2hiV2N
	xOiXYLWFqDMltgWq10bkiB6NJn20GlKrmqsVI5chiJfjwZiLkWszmUYYYDkFrtF6c32CW8IRDYg
	K481QZjkCCuyf2f5ZLX+M91e4elO0BHTGhJi3ul2TArOoE5xNOwAwCH/LovSE1jhR/mbZC/H85y
	p2Pz7yg9JiMAAC6DCzm6Q9Doc0kDaFl1DQnSl3CxaiGUNsfHKHPIC4wa1Yav4HKUsJV+JsvQgmZ
	p5CftplGm7RwnpTbaRde9gCOA==
X-Received: by 2002:adf:e19d:0:b0:47f:fb2e:f63d with SMTP id ffacd0b85a97d-48160715bf8mr52897928f8f.9.1787040471784;
        Tue, 18 Aug 2026 01:07:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b81748sm10126955f8f.37.2026.08.18.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:07:50 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:07:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Zimmermann
 <sigmaepsilon92@gmail.com>, Peter Korsgaard <peter@korsgaard.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, John Keeping
 <jkeeping@inmusicbrands.com>, William Wu <william.wu@rock-chips.com>, Marco
 Crivellari <marco.crivellari@suse.com>, Ethan Tidmore
 <ethantidmore06@gmail.com>, Kees Cook <kees@kernel.org>, Chris Wulff
 <Chris.Wulff@biamp.com>, David Sands <david.sands@biamp.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: drop ERROR() on copy_from_user()
 failure
Message-ID: <20260818090749.3fa0ea61@pumpkin>
In-Reply-To: <20260818012118.3903388-1-gonglinkai@kylinos.cn>
References: <20260817154604.70427ed1@pumpkin>
	<20260818012118.3903388-1-gonglinkai@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 09:21:18 +0800
Linkai Gong <gonglinkai@kylinos.cn> wrote:

> A failed copy_from_user() is a userspace error and should not spam the
> kernel log. Just free the temporary entry and return.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/usb/gadget/function/f_hid.c | 1 -
>  1 file changed, 1 deletion(-)
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 3c6b43d06a6d..5c39da1ac7a6 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -656,7 +656,6 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
>  
>  	if (copy_from_user(&entry->report_data, buffer,
>  				sizeof(struct usb_hidg_report))) {
> -		ERROR(cdev, "copy_from_user error\n");
>  		kfree(entry);
>  		return -EINVAL;

This should be -EFAULT.

David

>  	}

