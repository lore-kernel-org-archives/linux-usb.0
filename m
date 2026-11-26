Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663971;
	b=Zi/YIVbTaIcI7WwDcm4s5336x9/LKdCH0hQ49Vr1KKIEf8kkqkIRccwAWsECV0ln1Vcr
	 UITsutYVFJVbk/82ZEAAOB7K42bFQqyJzx5FeAzOOnegKf9bFwO67kx7svel6CiWWb6qI
	 JKJpi4qW55mccGf5kGVq0vXsh/VtwwrF4nR1pokB+5xursMMgTBjRP9j8xtz8YnVA99fv
	 jhF30ePQ/vHr5PTxeLxeQTgrW6PqbnBN3ZBSbRQ7OxRpHvLJyveOfE5/Z1Jkuxkshd5Rq
	 JSE/HwxwGEkCkuGP0S4W25M0jI/IMvT1muKfXiwb1gtSUNd/n4fEZMup6deAQb7SsMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KqMXbibufbrLO7FuyYV+tOnQOeMcHqxXW03JIGh+8Oo=;
	b=5PYTHptt9SUisHQucprLP6uscaTmfn0u5t9wZ5umZLA609V8HfMNLTR9F/zO/8Ou4as1
	 KrWSMMs6Mbt20KdDWUbir9khvzgGMcRg1k1zutUm8/lC+4XdL7YydCPH23AHfK+aL3B5O
	 aNj519EGLPYAJXW3ygpQ9PVekbo+UorojP5/Hlc/BDi9lY9UU3GPkWyZZ73skq/fMGjx7
	 ZOaEedC743dXPLyjSeQDKMeiyt97nw1Sb22dEUxtEiAqRkWqoYD8MDh0NhHbeM9EGXXS5
	 GmG9QYkVRvjQW0zT9uDoUEl/Y+PS15Ho/OhzR1qCgRq2E70kYVFFE0Vrxm4y6g03y0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nGgCfqoy;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959CB606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 03:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nGgCfqoy
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-94a08e4f95eso102308185a.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 19:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795663969; x=1796268769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KqMXbibufbrLO7FuyYV+tOnQOeMcHqxXW03JIGh+8Oo=;
        b=nGgCfqoywj9N/UUp7RYNDrk/Qi2joonPlUffAD7sOSXdh6zAawTaKRgf1d7HiE6UZY
         CwjJoT/XL7zLyDwjc4hFtjAmEy0dpsZQA+FZeZqfpxD/b2UbyZi3eruENCC2BfaEFn6J
         WGmgmKPAu7ZJzH6q0KlAkzFmFA6h9RrkNLpz2EWNEmw6OszUWO2rZwoLdnTPSHb1qrSf
         T4D5DeYYk/F4IXdF0VpddCKa12jrea5Hikgp61s5zP+E8Gy1KissJcu2uJPYrSLw03m1
         X9hPHDBzGAfq7bOQ6+7ApKMl815qJGek1c9fEtTEF1wA6txT6e386vvmBUwGMK9ANYMF
         X4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663969; x=1796268769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KqMXbibufbrLO7FuyYV+tOnQOeMcHqxXW03JIGh+8Oo=;
        b=aIsni3SpY8Vpd4I45RNpBtAOOYMedn+qI3O0wEWd6wggUjOLG/EsIPCkUsFk1F9W4p
         /b3PGFic3vCbIHQNVFgSro7vKJ+wwSdNySQ8lpbNIOpYPN+bPFaDgDNvSDwcsz/jNSAX
         bBLDxf5RZmB3X3s9FgAFjLyfDrg5sY5MWagYreJtpyl3o/ADLZ4ZR3lS8DiJJTUHiEIR
         qabU7qIUCm9uVLKsP/44ekzOOHmXpkMAQLbJMq0QZf/UvU199NldBlXejTx3+6gpsMlx
         5MXbIgD4cgdzTAQlEHm4PVCbCZMAt8xyV9KkmFFsCB8R3+VmlWXX8xg6UtJrbS0jPW3R
         lLag==
X-Forwarded-Encrypted: i=1; AL+hErHUiuVM12FCEprVHLI6inSqM3quUUORRLxkVUiV+beuIa8vLWNMV2aFxuY7/3m1DhpEL4+Smk0SXEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LbBWdSkmlYaHjBUKAZLUecTm3WJeeYn4be0jHFeYqrm1Ys9Ak
	gUHDsAR/aKUAqdSsIDdCafipHvnBympk9fvVavD+dyku5+jmWO2y0QvLkowaiC/NkA==
X-Gm-Gg: AZFdTZcKgLT0Ku4nLSXFLy9nz36qoqbOx9skoENIIQwZtBC0CdoZbIDAz4fWQMWjCez
	SMeFYubmScsArsJi+iOW76bJsEnXPYUZjRXL/Sk1tlUESLq3Va29FqCwsj1vzVs1wu4e6JbEAs0
	2BV8rrzExMhMrJaWZsFtTJLppnIs5T6hGnpDZt6idLgFYTNJn4JALv4yYfnesuoy7z6f7HwZQ3t
	CM+nA5+SlJfr79mdEjFpIgw+J+CJw+VI2b8r9Aqu/0NMDdUWLMaYjlnu47kvZArdlnISWpX3lNy
	1zLpeGxZIgzlgJR6gpXAhfs1EtL9/EzFeW6W/XedSx4bJlLI91rsmhbDdYCGrNm4yRa77XJBGSa
	x252FMVYLoX0PBWZYhzJYZneUo/R2XakGsz1SwVVxG94HlbRdWavkwcW+rqkciFptXxGd+FZfZ/
	Tyq9iM7e/YY5BBOs5bce6QAVrRfomplzuMSUAetCmbJhgqlD+Piz2+frbddO6d7RrPm4BINyXuG
	pR2jnX/b8zCIhKDPyGjaK5L4az1LBtdkkSUCssK1eKVruPrBjL6xbviC+C1M0bcUq5JC+rPz8Y5
	QRjdV/ytZHVNiCXNeroBooBLwPUzSw==
X-Received: by 2002:a05:620a:46a5:b0:93f:6c76:215 with SMTP id af79cd13be357-949bab157e4mr3534856885a.50.1795663969349;
        Wed, 25 Nov 2026 19:32:49 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1245909585a.20.2026.11.25.19.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:32:48 -0800 (PST)
Date: Wed, 25 Nov 2026 22:32:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 3/4] usb: gadget: gadgetfs: prevent ep0 event counter
 underflow
Message-ID: <3fe932e7-fa30-4d3f-917a-2ac8c3fd9605@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-3-8f90434574fe@gmail.com>
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
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-3-8f90434574fe@gmail.com>

On Tue, Nov 10, 2026 at 12:13:24PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> ep0_read() snapshots dev->ev_next, drops dev->lock while copy_to_user()
> runs directly from dev->event[], and subtracts the snapshot afterwards.
> A concurrent disconnect, connect, setup, or another reader can reset,
> deduplicate, or consume the queue in that window.  This races on
> dev->event[], can drop newly arrived GADGETFS_SETUP events, and wraps
> dev->ev_next if the queue shrinks below the snapshot.
> 
> Dequeue the events into the local buffer and update dev->ev_next before
> dropping dev->lock for copy_to_user().
> 
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>
> ---

This and the 4/4 patch look good.  They may need a little adjustment 
after you update the first two patches, though.

Alan Stern
