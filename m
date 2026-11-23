Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422478;
	b=09AYHPrGxJWe0ZYpm+P6rMJjguJIxupSZ88HTy/8ikoaqy9AcTpw1AXTsq2GD3MfKBFt
	 nNMae/Soctg+UWkeoMDYhVksIhPR93kHu2fBic6wrmyWAJYNUKlsbLtOATJDSJ/+du9Za
	 Ysam6BvMi+QhYFYjqsR36+7AYZtXuy6NVwcR93TGLGjkx3Fjzn/XjGkzNdVBnyoHAFO44
	 VI+273svdvJjeJZlA1NGK2tIeBs+zMrlUugJRtgXLgWBHY2oL/kLmQfr/OJVMru4/m5Wm
	 gf+rsjc8bF0iPrj0gf4rxz4zfiIOeFdOnP7/yD+9K6CMxXQb4GCmkKHiNhax/4ZmftQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eAf/LYtQdzETgJNaoLTxIh/MMYqJFTgROGsz2hEz7zI=;
	b=Rh1eV75vqOC5SfDsHWn8ITcXRtDA7TWg8KRxL3UJqwsvz2NN7SPBZAlG6DxOY8KB7l6I
	 1SwA65lb38NT59tKe7pUXW4VPByZXhT/3xU02cIyMjRHcLEDm9NkXOwyayNULjAi3liUw
	 JJw55/wXMgkD5QFp5ckjhzXxOhHGv3OoykLrm5qwmlo1Xmuxazx4k/upbTE7NAvw/r5GP
	 YbzgD9IoJqPj5vL4aOb524SAznvuQ9uyD2GUSUo6ZjAFusNMERBKim2W3jRyLcBV6kDm8
	 sHgQcITOJ0OjiRJgC8rjjaZGnIsoN1NkFS64kK53a3FpRTEJ4gdFSOIoY8/+frr/G4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MUcg5Qs8;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824FB606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MUcg5Qs8
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a9be758734so1754813f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 00:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795422477; x=1796027277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAf/LYtQdzETgJNaoLTxIh/MMYqJFTgROGsz2hEz7zI=;
        b=MUcg5Qs8HOGbVD3a9+8+XyUDTDo2XHgDr4iDZMV/QDQh2BbTJc27yR47TH7E0ckJv3
         zRZn92fj2+uJBhQbW2odayK079NQuK+L4CJuRSd/VyxbvDXBFnmmnUQtcyNz8CASVjfA
         xUsreHPFwe8b+qlE70brFZI0TOxf6FAY8u26l2ImsYu60ijUIE1Q9QjjsBadc4zOadhj
         iJr7JmfJfIf3qjrm+nD89qsuIeBsdKaSTW7ohuMXPPowo9D8Fk+uh0QEfPTaUyQpGMbS
         vz498c+CfhFZZlsQLchobeuLiOCJzwfuDwxhzGAVF6/+Ts1ZpPOmY2qAlKsHoKcM0v/g
         p3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795422477; x=1796027277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAf/LYtQdzETgJNaoLTxIh/MMYqJFTgROGsz2hEz7zI=;
        b=jLfeVgrZGnfJCsd5wBRM5pKMK53Aoz9VZIRfNoGG5PhAYksYPrhawX8PyW7I4C5vkJ
         C+Jo/JkTB9PPSP56sVTYEQx7J8Q8kUYqn8kJhkX1Z4Sn1/ShOsQgdcB/Hfjl27d+ty6l
         BSws/z/aEyZ2b+2lYY57a/CIBXWSypjB3WD1DOSydUMV5xqUduLz5k3OhhvvQBQFnL3g
         AK9HPFqgtHoaKUnq0OSlUq9lJkm2O1vjwPkzR4vng5jR5MTbk6ROl4GcpbC2L+jwmHDZ
         6p0weLfsz+MFdmLAnP/7y9w6gxI33bXZhFqkBi/Nz7tgdeJh4cLX6J6P5t46mk4ymffO
         /1TQ==
X-Forwarded-Encrypted: i=1; AL+hErFLMKqZ/qzh2zWEgUVvPaPGu9UaR8roZvS/gsqOR9xRl0ffP7SrDaSehYWycdGEgUTniFr9VR96Aps=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kYXECWZhvSa3UHtXOpI0HXCayeW0HXVJ0vIohXSnD43j3ivQW
	JN+9fbpBP/Zx5EiINoZZ4pKgGNksnkMEnyx+/xf4xSL2IoNF8cNFWX3jNxSf0RNJR1c=
X-Gm-Gg: AZFdTZc6GNsTy/reAdrs9jvqPJG+hTvf+66nWKWdJQtsUysJ7haI41/y5qwMibEULt8
	EEq77hs+Ub0xE7GfJLPBmOfWYtWSZIvdGzV52w4bU34qFLW2HAF544IS73OCB4i8xL+w1z6u3Lp
	80xTtUNN9LCsQPP9vb7Z98UKV0dvQw3AOTmtrubiyfVsGR4v1NNtEUr8y9sX7CHBKHfvmXBjksJ
	ItAw0DCaItLON+p9Y2E36sV8s4corgB6zT+2uUSszHOev4Mb3TNvmbOQPBEFcTMHCyHPVcPZu9C
	PTNBCDCIMBZ9Kiqv/4fwCyabQi+hrulVuD8HL3UyYV6d/2GpmujKd1EperHJNoPL9+IYHct0d4T
	9FMpj+dQrBbqJAYzahJX+Kga6oAdD37aFMXI5EGwILt4aPpVf6E/KFbpMqfuFXa2JI+DeQ4oG2y
	BR9QWsHGMnYBRb2FVcjWmcXcjHGP1sddZR5KVba6ixQj1K4B21G0z/eJoCGLZvDZLJGrJKY/3nA
	5w+Oqr5UxzLnYt5H2n9zMpI1ZRpupSxfY0mNRxFGOm8Hw1VSj/o+H44dULCkTXXWIC0ag3i2VlS
	fCpSItP5p/a4TZVXh5LjF/qu/c2youV/XqzhGnVSsBvx2JeA9omWGjpNwJglJqZ6uu0RdmU=
X-Received: by 2002:a05:6000:188a:b0:4a9:dcdb:2e23 with SMTP id ffacd0b85a97d-4abb4f59b64mr19748393f8f.56.1795422476913;
        Mon, 23 Nov 2026 00:27:56 -0800 (PST)
Received: from ?IPV6:2001:a61:131e:b901:6da9:459e:7c6c:e85e? ([2001:a61:131e:b901:6da9:459e:7c6c:e85e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm21089807f8f.6.2026.11.23.00.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:27:56 -0800 (PST)
Message-ID: <68f6376d-a0cf-4f87-9cbb-0afb7b8536d4@suse.com>
Date: Mon, 23 Nov 2026 09:27:55 +0100
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
Subject: Re: [PATCH 1/2] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 ata_passthrough_disabled
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261121155253.4980-1-mat.jonczyk@o2.pl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261121155253.4980-1-mat.jonczyk@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.11.26 16:52, Mateusz Jończyk wrote:
> The uas driver blocks access to ATA passthrough commands for some
> devices it considers buggy. However, it does not expose any meaningful
> information whether the command was disabled by the driver or is
> genuinly not supported by the hardware. This creates a problem for the
> smartmontools program and makes it difficult for it to provide a useful
> error message.
Hi,

thank you for handling this. One thing though. This requires putting
the emit code into every driver. Can we centralize that somehow?

	Regards
		Oliver

