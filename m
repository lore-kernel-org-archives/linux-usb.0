Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424033;
	b=Xd0cRc/5TA8PGeL6ZjIQ8/rbSE41lprAkFSSdP9xYQrmMO397W4RTEukVDgEJkHkUeN9
	 dlwfsCDBOQx0aExusMyFUzPCnLsMbnZatwf9lzeA66/tOf+NwpeVAJsjZg+UqKiJNUUIE
	 LMD87hLLSGatUgChv6Hbo46yEv5ij0Lj9ONFkpebbR0x+99OqgxuHC6xs9abNAwPVF6aR
	 PyG3eoSud3EW4qMLtdZRGp4q13e4AjvUTtgZtf++dZ2zOsQSpnVk4LG9147LNDd2cGVLP
	 0LNoA44qjI4QEMlY9Avg26kU5pzDxilIhTCv+mQrh9RWbpPQrQWce9u+hKWd8buxBsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qvGcuiMvzkgnIAM2MInhiFXlOFrLbqnlcDucLLp7jgw=;
	b=P+NSe600hkWcoS+RbwXCDZEVkXvilp+i0UZuOYdaE6TdjVQZIoaMiTt6DMu/Ky8A077r
	 07e6AfwNToUI9wAjiDwicXkfsb3Keb1coeKtsPBsdvWfI6Q1gjkKtEgIT0/srcYTkb//p
	 wrgZMbw1Qhfz0SovQErCAvwiymAfH62wdtFq7BKCsAYeevsBhyd5gb6kO9ztTA721TprB
	 zdtT4RzMQBgHr+cYrb1iPAuNBevTNAOO4YiOmV2vV4QJkKt6jrGJCV1ibqrrPVO6fK7po
	 xdq7LHqIhCa4obqtUhTg9lLT4epxzuSwS0kAi3P/cQiqGz/ym4seiEv3kbsJliDMRMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Y36KJ/+u";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F9606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y36KJ/+u
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso29070355e9.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 00:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795424031; x=1796028831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvGcuiMvzkgnIAM2MInhiFXlOFrLbqnlcDucLLp7jgw=;
        b=Y36KJ/+uELTQEZY98mnBxgqeidd1AjqL6IC95iTjrD1MQcPwDUAXoqOQ41nEjnqhX8
         z+C32A3W7nsGEaBnaGCIo+bjaki/dH78Q79x41OkQ0jPmlpMg0f9GPwXGCTQj7e5sAIN
         3QpwxALgM9ZbVEVL0ADyu548sPr9F18ErgG9ucJvSVpA0QGP/IrQ45fl18X1fZrB/bi7
         akMgL+3K5DDuXjoeg37350xVfUriTAywWa11RdTCQbwm++MUV33DfSHBYlahX7YT+cYj
         ad1AKzg71It2G3mnFkZbT0zqu8KLJJMdbLkxUEPvJB+KT0nwrmmiyEUEGdokT0TkOWc2
         NBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424031; x=1796028831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvGcuiMvzkgnIAM2MInhiFXlOFrLbqnlcDucLLp7jgw=;
        b=RtG/XxOG7Al2i20RM0dCSjwMn56O77f1D4FlN/PPQ33ogn4K01gSL8JWsEawbtfpol
         qUEnQeZlbY6Gl1WTSB85ksGqsfeZ3lQZkRy0ya4gEflbhL22wiUaSWTBrJ+B+lZoVzg7
         S+DPKbqvAEGvxwodJhTUbF4TfhxnKKK1x/CDh2MMDXLT1qSj9JcIMqR4x1Hl8TEM3de5
         Ss8s50W2u4mTtnq/sKFclFhVlId5J7V7HTITaAz2zKfd0zcipybEho4z8fD+FGKVGUvs
         BpYwMwnwp4mljKSrGvY57+jNKS3MTpdopSVFlpC9HHgpRoYD71nNH8f1Kt73DFH+Gm7a
         Do3A==
X-Forwarded-Encrypted: i=1; AL+hErEJq/si/hZRoKLjTsHE755P/0eAD0WnZMjEvi7Oz9KM27DqoBwpbx3LRbWHl0cv13VGck3GrVKqFP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BTrX23kGKNLfD8o1HEkHf14k49BQRSH9ylwJNfT9mHYw7ogJO
	2nJ9jpesbYA4hNF+bTkLfcae2ZPoVuyi7hD2eMTn6Cl2JEHT9gKf0jxxWgKTr8CZw8J8Gji8ckO
	eWJwT
X-Gm-Gg: AZFdTZdzVqw+A3v9eB1B2/5RHjZxFBEfw26HlZUWD+QjAO4SnKzp/YloYezzivmtjG6
	VEk9AjD8Y/6GayHNmeFdy+g2UHPk+SkaZvC473FT5bPG5sz8hLP3GzsbjL/Z5mdDp7awY3aef8d
	h2bWJfUi/nD3fXaZ+Asxv2/sniyK7zMROXxpGEn2m09hnbqdkOWC6Vppd7j+3CodgEPWpkYz9kB
	3aO8lTkac+R+gQFQNPwaFCEGxFxAkkOwyw+gm9P+4ILzC4Aep9EYoI0Xk96uyytI43GbqwghjnW
	9oU5iwjZYpghbbhHE66IEJoVu6J0wPil6zR9YFG0RpRDvEm8eU/yZS6liChgFFdON8NL19zjOby
	MFM58+BdFwc8mcz0y5UOhxYPzwVC16mR6FrxghWSEfdSVjxPiJJ2ReO0eGcsj2XwDaDMe6ETdd3
	Ng+iL1a7fDNjuj7YxZssDV4XJ9y88IOgqCF6EGocuRKcnwyEi/xKatWpAq2PaHeOfhK1LO8hi87
	QXpREb2cESp7loRIQAN2vLTso+Af0O50PeFiXF+vldrIBNGcawM6/fQo6/QSwQqjrqCIZaD3UfK
	CzcbWbQfMhL+TfOqW/WX2eMlHkXc8bpwFbIYOWt7GmYKgT58Iqq9pG9l2UtvUpGucDQrXyrWhUg
	x0uhu6EhTCMu42ZE6
X-Received: by 2002:a05:600c:1d09:b0:4bb:6fd3:5ac0 with SMTP id 5b1f17b1804b1-4bb88816c7emr237165875e9.28.1795424031393;
        Mon, 23 Nov 2026 00:53:51 -0800 (PST)
Received: from ?IPV6:2001:a61:131e:b901:6da9:459e:7c6c:e85e? ([2001:a61:131e:b901:6da9:459e:7c6c:e85e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm331210845e9.15.2026.11.23.00.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:53:51 -0800 (PST)
Message-ID: <f9715edb-94be-47cb-8bf1-f84a3323f000@suse.com>
Date: Mon, 23 Nov 2026 09:53:49 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: image: microtek: don't receive REQUEST SENSE data
 into sense_buffer
To: Alexandre Becholey <alex@becholey.ch>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20261119084526.535901-1-alex@becholey.ch>
 <643a71e0-7347-47f3-8cad-ce31f76cb8af@suse.com>
 <AP57iwtzG1Kr6EB4hY7F0Hd-DaLhPZJzxoKNuvDpeiAKZvyxsddI1fl6kRKAc2Xg1ox0kL-KAdNYmZrRMEYN_mZRamfiV6nXjdcfDhJhGyY=@becholey.ch>
 <e3956050-8b80-4270-998e-2e5ec70cbdf8@suse.com>
 <8iDv29vCFEOxycORJWCZZoTT9dMFbUZZ9VK25sT27tKoWWtaKvLKZaW2YoQDygTrSRkZRE6Pu5PmkMFLl-PDCWXI9n1l-LSB9aJCByn8gks=@becholey.ch>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8iDv29vCFEOxycORJWCZZoTT9dMFbUZZ9VK25sT27tKoWWtaKvLKZaW2YoQDygTrSRkZRE6Pu5PmkMFLl-PDCWXI9n1l-LSB9aJCByn8gks=@becholey.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.26 16:14, Alexandre Becholey wrote:

> I looked at the other drivers for that special-case REQUEST SENSE
> (in drivers/scsi, drivers/ata and drivers/usb). They either
> transfer its data into the command's data buffer like any other
> data-in command, or emulate it there. I found no other driver that
> copies a caller-sized transfer into sense_buffer, so I think the
> fix belongs in microtek. If you see a place where the core should
> enforce the size, I am happy to look at it.
Thank you, that makes the situation clearer. Yet it kind
of brings back one question: Why does scsi_cmnd have the
member sense_buffer at all, if you simple can write the
result into the generic buffer?

I have no problem with cleaning up an issue in the microtek
driver, but if an issue is to be cleaned up, it should
be done fully.

	Regards
		Oliver

