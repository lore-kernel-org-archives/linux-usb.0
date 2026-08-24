Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A32C3B2FF9
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553665; cv=none; b=eHTpZpYyJbbe4sVv0A24LiBkyZytJnvKdhTJL6pUm/jDNUiNuRktQk/9KGIV5okiSSIp16UQzd+3G+r28A7f7NDgzO827KSkuEy39sNAvzD3LStU4xLCw/wmOOYTOMIlf1rhA/Hu6yJnxMbZLLjVQPBzWbgehO/1lpimUNBekes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553665; c=relaxed/simple;
	bh=w5T/CpzZNH+Po6ctf9eekS1wGRE1YNhAce0uyJz4xn4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rPtHN3eE7OC9pg6OvdqhXjttCJPFnzKl1L+EuuZrZH3A3U1MOMU/5R/lcjQxWLVMpnQ+e9f7DttnB2mxfo0Syd/6dQL7VzDoGyI1hGlrLUyA6hVWatYPv35rZ4eLvNxUIIzqGkPBr1MuoFkCnvm2ay0jTi47hZFmDYJYFqXMwa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiN9eQTf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiN9eQTf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a422090b14so4149474a12.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 23:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787553660; x=1788158460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0gXhef06+kYUg6uksH6pZhR/nr5m3jbOk30lqsvuPnA=;
        b=PiN9eQTfSIQfYqOW09mF9Zxed9p3bYaFXHqeUz18Il0/3dXkCaewZ6z8u5JKEwb6Fo
         iHIWwL22zIMfY1nUHQlYdkTwOzSOqQ8Xi5MO4ihgzEYcoFJPrOvbDuB4kP3KIY0buNLW
         MyUjLl9UumIcU2O9bGOBYtnLF5L5ITF/+zCC2hngsEQvhhunmP1181LEzgsBY5DrpW8e
         YuW2PRJ72nwak0XFrxPA4crv+6PixDPbOP7ZvATx0gaRkYhXTK5OG/EmqO4lX5y1t2Vf
         b5cyGS8fD+1XaX+djAj/Dm8EANFw+Qfhu3C4qw6wcjg452R4qJ6O23YwCTodhMftKNqG
         7ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553660; x=1788158460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gXhef06+kYUg6uksH6pZhR/nr5m3jbOk30lqsvuPnA=;
        b=j32l9FrnkvsyCxgPQzxMVHEsXgqsRyj9Xe1oWECNss+FfVHl3/vH6pM33svucCePcg
         HfpzH1f3SMfRUgG/1tJY//NMV8ZnebQNhonIO/zUhB+4AQxzfsFKGzGQXMHKYBEcghgy
         x9yv/Xa4nx3Yeq76HksKt5I7D/LVNNOltlgBtugSYIhmWWY8DlQuNxHhePmtcRy/8nNe
         yVQWlD4mdu+afHWU5VgQ1RSmdgWoXMQBrJQpbY5HHX1r9XXH9vDXgK0hykqsqBflgPH9
         NrbfqrGsikQ6aaqxsyIirEroMddiAmvTMF6NJ8GoToSik+kimND0U1fTOHlHFSdQhqPL
         8cSA==
X-Forwarded-Encrypted: i=1; AHgh+Rqrkc6Y9bZlJ232YpMCxqe+RZhC87TOODCD+ODojb7zuecGqqCavnFIcLz8WhUIpcQhjOGJ2emex2g=@vger.kernel.org
X-Gm-Message-State: AFuF++m58wKiEceqQ1/sxhLqr+/1ztX2BWntqlor+p2tRC9N6Ukr1VWv
	jspFQvfu4JZEAyPYhWriRzkqG4XNzOrggUFddjTTfoOfQPiHNSQ1h6NS
X-Gm-Gg: AR+sD12QUNzFkKHwFmSK52PjlL3JYgYbh72hLVvvUwFZcT2Dqh7tOQbMoLlxoSd/wX6
	g/g92PhWReQnY1zVRZ+1QyouhUfLux9I6FQDgS+oL2IW9fnO54HKt4fQ2Hk9hVdfBrRnWi0dDVN
	GnAfANq6AUTYc+xaDAmv6YP5uaTlHJJZCOfnwAH2kKypuKjhp2AUCdMJhhZCAdGejUPvME/sgM/
	Bdw2RhT9dsrKs7rgbPlSAEFaYfYRuti3ZDvLvj9UmzJmL6zmOONivmsalBA237RDG/8xcYpL2Lw
	48fXB/DUCpTvpyhGdRfgAXPmrjQSFSxayP+IZeSreU9EcbjtHnf25b7LDF5wD20fztkOHk3iPGf
	L57iItRIdpkkGp/BuYiwTW/+w3ZlYn3LFRdzTI0X3lsJfcbb4r/Ad5LniDHjNXHyqTpexQ7s2rX
	x4wAZFonvgNHgZlgtVCsMC1FEtKLGP2hdS+ebTYEyPc5aaxJ3JgipUC59DH4xyr4c8+op2jBQjV
	EcQHicm/2riYqF4Fr2dcdBs7n8RZ3cCjAQwJX9kh3y0Aj2SyUjE459lj6el3UzEI6rz6x2GqDvy
	DdgKjMd/P8Mu/L8XS311VbsfIl4AiUKHqbHmfe7l9hBRJN5WTbG+PJ2PBjOWmV6K99OsoLobc4Y
	WemPBTtQF01YL3jD9l6QBEVqZ30TNbaXQs6av7OxHORjTbIO4Cuql44rr4w85skwweZ6iNw==
X-Received: by 2002:a05:6402:21db:b0:6a4:cc9:c8f0 with SMTP id 4fb4d7f45d1cf-6a582b052b3mr18432026a12.1.1787553660246;
        Sun, 23 Aug 2026 23:41:00 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1c3003sm6885559a12.23.2026.08.23.23.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:41:00 -0700 (PDT)
Date: Mon, 24 Aug 2026 08:40:41 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: typec: stusb160x: add missing NULL check for
 i2c_get_match_data()
Message-ID: <20260824084041.0000295f@gmail.com>
In-Reply-To: <20260806084301.1340-1-joshua.crofts1@gmail.com>
References: <20260806084301.1340-1-joshua.crofts1@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  6 Aug 2026 08:43:01 +0000
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> In stusb160x_probe(), the return value of i2c_get_match_data() is not
> checked, causing a null pointer dereference later on if the device was
> registered manually (without devicetree or ACPI).
> 
> Fix this by adding a NULL check for the return value of
> i2c_get_match_data().
> 
> Reported-by: syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6c7e68b141ebd3a2cadf
> Fixes: 823754697556 ("usb: typec: stusb160x: Make use of i2c_get_match_data()")
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/usb/typec/stusb160x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index 6d85b25b40bc..8f3435c669cd 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -645,6 +645,8 @@ static int stusb160x_probe(struct i2c_client *client)
>  	i2c_set_clientdata(client, chip);
>  
>  	regmap_config = i2c_get_match_data(client);
> +	if (!regmap_config)
> +		return -ENODEV;
>  
>  	chip->regmap = devm_regmap_init_i2c(client, regmap_config);
>  	if (IS_ERR(chip->regmap)) {

Hi Greg and Heikki,

A (very) gentle ping on this patch. Do you need a v2 to include the
Cc to stable?

-- 
Kind regards,
Joshua Crofts
