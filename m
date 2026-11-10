Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331921;
	b=Kh6hth8LChXO80TblsUVont3+nXgaBGDk7WUwvNEBfeB1oCaa9urjAWLH7JY7fGZpXHF
	 T9FBd/Q0OHKdsjBr5P6byTJ8dwxP3fxbSriDzdG8W8j7G0WY95WrgHnyzRFRL5o+8oCLW
	 0rQkdSvyvK4XY9jpvpuqCzsKARkAYacgqZEFVl/NvWrNn6UPM64Yh5mZY5Z8QMk6FQCOh
	 973oHgq23wqkcGQ33M6wQY9JTJ6G86dCgH6XqaWF0ycMGjsoNa6TeueHIGjs00uPqMwv1
	 6zXLuIFDZsFgXH2i2ladOkoQ2QISr71xObqS/mor2bzVrYQfdh6T/5HpvsEtlW30c2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=yE8RUk5F65DsrfpnHDuVWA31H8kskcbAMcGhVlDu/Xk=;
	b=wJerX9qdUiUBeWznbH7TBbHHQspDvcCceSEFebV4Aw6nVjLsLxtvLoLCL2eb1tRiWHtm
	 QDVMDN+UJK5hM4qlTJ+yijG+6TYvUIG2MQ1K8gbB9vqCPN3s6iK7h3Sl1L/GpYwM4p30g
	 kzARbKd1ZqZ+wmR2DHlEkK9/8uroqm89uhI0F+8ejzYzfsdJwmKercO84kW21jOcJjOLq
	 DRum/YGSLOxuvK+vy95KWGQfcGaOdOIztWAQ3VN1veINigfSUjDsHsQJ5YqsjMmooAtEv
	 IuBygv1knF27Axh9ypFm0MvvfvO043CMXfXd6kfpk7+psulgUEn6ivxTA8m8tOb6gJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtX+QMRW;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A940F606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 17:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A940F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtX+QMRW
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-372bdb942dbso2994468eec.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331920; x=1794936720; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yE8RUk5F65DsrfpnHDuVWA31H8kskcbAMcGhVlDu/Xk=;
        b=qtX+QMRWcHelEaPp+zH/VWRCnNWuslAuYoNqAhGADiBa3DGx+5nFvOgKICPel5YOr6
         isBQndJ3/Zs9dKRI7CA8YuXieaFd1LdQcB5AOzyUalwhx5MYJ5JAsgDV/9PT8GPpRcX6
         NVvDHwCUbTkOONSEFx22w4ldDABKesrxJxbyjizNjITeozA9wLLPywJlk4KZcs/v4R0U
         GK8wCrAN2KtzE1YlxnPhWg4aS7Vux3YQcEauGkixOQ/mwRc2dX/RTS7gRED+pA6LLI/G
         59LTfYkb7TT7h2xoN56U5KYcg3r4W7JtqCn99zPVe/ocgNe+iycK7bKsZB1FMWeB/F3Y
         DP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331920; x=1794936720;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yE8RUk5F65DsrfpnHDuVWA31H8kskcbAMcGhVlDu/Xk=;
        b=NaEyJ2o+uZlSmHwIu//zSvEX36LxizdNDhnbqlsK2mfqAqusw+ku3Vnct5BUi/pll+
         VQUho5Ae9ivwL36kkpre0ROBO/T6Axi64U16Z32q1+cEEk3vFAMDGqnolaQmkWFRwvsz
         pQG/CUIALSyb51o8iptbKjnCzPAZ8IpQ5/49DdBnkVSkMzUIeTMGd1z9xnxpAwtwTSfb
         sQrWa/+BwAnSHh+tAo9eHEbLZYZRWwmDNlhxnokKSnctCbmJZq+1PAgI5gIl2zpudYnM
         U+SLBEJYZ0NswjyJ0zvFBuQ9mdGWkxWTetpk/qk1qcvGOl1fLKVxDN++rg0I2fQBBIPj
         vLBg==
X-Forwarded-Encrypted: i=1; AL+hErEDy3ZOSQQNCS9hPLOHRxHXjdVw8WNR2ZPQuka5dslXX0uXVeUyBy1jIwLL44E7Q/BWdZw9ylSM3hE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XJ0V9M/TT+6jIqsSJt/e4AJb5MPBNs3lw0tiLFzN+k+/erjkY
	nB3GtBFX3qfdsVmaHo8kxvL5H1FzFHgbhiR/LOh5iXKAZxT3KyHBmG0L
X-Gm-Gg: AYBFou01yntdgNh1oj8LTQcyQaey96JEvKRVZLq8zjG56aXp5lzkZDHQqzAp0mlvcdp
	N4RIrqlmoSvAJ+/SgDYwQdQX0yhrzEKAyJt+yf4KhTk8anTWldyqlYpuFHdRld72CPPgKkZevA0
	wW1NVg2/letH4nXbadJMyGebqQp4FV+gJDCdwkJeE6/LaehIqQW7IX2Wg1hzi3EvZMEcXjauf2s
	CDzg3bWyjCVRo+3DF06k6jPdnhqd2OVbKzcl0Yrrk0lVHOIqxzSF3DxK2g1B2SId2jL7i69aTMV
	mec90eKQfdyRZH7Z6XPoQBR+/dWd6COxrD9Jau3rJa0Af7CnAI7+2ZYBJvCqPmJCA3eYpjsnByv
	IwrpmgaVke9XAHNrhiSTKIrdvmDtkNeSs2bk8E0nibwYPeq77i+Wo/tAQdgJN4esbx05syzYpnq
	J21tc4slmCzkW8F6N3Tjm1gxPsKo1ChOmY2roOV5cSZaNzlAJ2QkiTVqXBPjgNfvMQ+g5fj/ilE
	yzVadQYElP/0grADjkZnrdYDAkFPzWKj9QBcZCpS2pM6HcakfbiE7G8e06NNZ7Sg5dV5FJwt7El
	OcTnHlHmsBFSpg1eYf1gzb3zClBHzasY425R3g==
X-Received: by 2002:a05:7301:fd03:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3751ee7c2c9mr4017982eec.7.1794331919552;
        Tue, 10 Nov 2026 09:31:59 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:7392:6aad:f285:27fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm9239979eec.21.2026.11.10.09.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:31:58 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] USB: legousbtower: use stream_open for stream
 semantics
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: starblue@users.sourceforge.net, gregkh@linuxfoundation.org, 
 legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028182802.25212-1-mdshahid03@gmail.com>
References: <20261028182802.25212-1-mdshahid03@gmail.com>
Date: Tue, 10 Nov 2026 23:01:36 +0530
Message-Id: <179433189678.152716.11457478975708955224.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi,

Could you please review patch and give your feedback,when time permits.

Thanks
Shahid.

On 2026-10-28 23:58 +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> The LEGO USB Tower driver uses nonseekable_open() in tower_open()
> However, its read and write have stream semantics.
> 
> Use stream_open instead to mark the file as a stream and disable
> unnecessary file position handling.
> 
> The issue is reported by stream_open.cocci script as potential
> deadlock between read and write operation.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/usb/misc/legousbtower.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> index 18dd4115befb..b849bd0e9664 100644
> --- a/drivers/usb/misc/legousbtower.c
> +++ b/drivers/usb/misc/legousbtower.c
> @@ -313,7 +313,7 @@ static int tower_open(struct inode *inode, struct file *file)
>  	struct tower_reset_reply reset_reply;
>  	int result;
>  
> -	nonseekable_open(inode, file);
> +	stream_open(inode, file);
>  	subminor = iminor(inode);
>  
>  	interface = usb_find_interface(&tower_driver, subminor);
> -- 
> 2.43.0
> 
> 


