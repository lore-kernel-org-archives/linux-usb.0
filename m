Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333742;
	b=XrjQXGnIrTH6Br0sd6yoZ/lIzrv1vTDqo8gkssLy0zORzyAuQxLBNBABLsLoh9S2Ioj2
	 oU7J+Dj1bi/rn5Se9f/JLC0E/qPXuaFU/zAGsfGez2jTB3CkHFb6sTHqtf0mpp1/FRMpj
	 0cvayxf/wTt3MeIBZEk3RppQ/QUzHjwUN8wzX8yKzVtjxEE5WVMka2YWM/zegOVbxsR6L
	 p42uluewtJbkL7bqM7UPu0D1Z2zynPtfBsZf5ezDAoAh/lKABsoBjmICnla9vBb5EOubZ
	 A080bi9SkAkxuFSuGk6r/0ZYNyF4iDEPbaY3yakdU6LJKKY8xqWDCNfkXx1sOho8gmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333742;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=wHzP3xDiqkHH4imeAjQs63vhz22eXayGQ9d35KFXeYw=;
	b=WQq7cF76Oy/HERa+7+ODF7TR5i9QWj/iAvrXpXAeSmT4SLqLREvZWL2sSUvcw/qonE0E
	 6y932kJXZvTiJpZUmj+b+FZ8RenHJ5hHZ1g6RkhCJqkHYelid8HbpWo4SGMKe/nVpr3KJ
	 5y+L4HQ56XO35+6UQ2moRNCgAk/ND1EmgTKgDgx0FqdvoHROodrf1IhyeA1h2gAjPRNWy
	 I1QTafMWglbysPrn6E4NSPxXOyIrKObr2+p7EoykaXOMQnxMY4rQbcsth6TRTiUTKe/OB
	 lFW/ePIEcFzpKFHL11o8hQw1dVMBp+vZWX4oljBQxEn2yplDvJ6hVRvxDpswiqB2Aaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D0DhlKJG;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820C1606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 18:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 820C1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D0DhlKJG
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1104989a12.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 10:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333741; x=1794938541;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wHzP3xDiqkHH4imeAjQs63vhz22eXayGQ9d35KFXeYw=;
        b=pxZktRJ0/nPTuJHcgrFYmpaUHv8DSiu1Kq1E0aln3uDXjoqR/IB5imWbrA7pMJnuy0
         cLhgxKgQATr3GWBSC+eWY8Sj/jthyDPkUpzg+41YoXmfwxlANtltVnlZ3tfeZQDbcb8c
         3peUB8O2IpekwAK+grJgdfmV0COiuhqzWPVTQWIOCKhYOOyXriQ8+ooW6gwSwM6QVMQm
         YPhysWCQpaYq1gxM59g+OkBLVZXMa/wB59Q5vRIGmOMQHQqKMe22LTwdxTY2w5eOUmUi
         voeU01zB2A5Ld5h6jl8IAe454xidacErh9k0CUjyoo1HP3KNG2m9WgmcbzgdeNxnJsoH
         VDnA==
X-Gm-Message-State: APuU4Z81Sik/akvPlHUJwIFovi1TwVDGM2HwE6739PNp7hub04AdDpeQ
	sZ0YOp2pme6uQp89t1GOXd5n54MDJGTBqwQEp78qgYBmJO1xb/Bst6vwpoej9INaw+N7v4fNO+E
	XxkWvAM1v3tYya8C7YQ62aPD8bsrEbTgCGkRz9IbKwcpeio1KMkE2XntSj/ls90nPA6Z+5fe3Sz
	C/UuQJ2qykHApgCA/IQxFEkjRd8iJ+a1b08yXTfA/wyRbJSYv8fsnSd4La21l5/FYJW/sRaZh26
	OjVfGegosWcmJP4nJ/w
X-Gm-Gg: AYBFou0vXo9gnjxUnaDt2POhG0ei7Y5R2WqwIjcp1AshIbYnE5H2ymvdEBRrauGltp0
	yExHk3Sga6AoR9rl0i6M4dMCC54tBQYmHf39DpCmn78djWV2uUP+s7ioMghMvqDFIuPkpumjAFs
	j4xzdOo0nijLsW6MlikXXKLYzZLIEjCjEwrJK5XhGEmc9jcYN7ckqozObELLnwOc2NKbHtcrOUu
	KxEPBbY7SSUpoWJbzjOCv9rRdk1jgnprwEhbEZchNTpMLzQsBBx+40asOJMnogVG6K9t3eCGUi4
	Cak2ZJZy2bMjhVoEHz4Rnj/GM+sqCvF+StjNGdSIhfZjh1jYyWuvnSfBt56WEgr0yrfHlIlpjOs
	0WSlxSgOsvYijQmPJ/HgrhDjvxzongXFOHEjLbFvAyIJ3dsgBkgWq4uSdlYNDwT7G3AhOUm9UsH
	CDTWQXDYsez40Qalf1Vvg8J1GgsmRIvHoqQMnCoiUO
X-Received: by 2002:a17:90b:33ca:b0:3ad:544f:81e9 with SMTP id 98e67ed59e1d1-3b166cd510emr2964704a91.15.1794333740566;
        Tue, 10 Nov 2026 10:02:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181bf9bb1sm21233a91.2.2026.11.10.10.02.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:02:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso1994626a91.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 10:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794333738; x=1794938538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHzP3xDiqkHH4imeAjQs63vhz22eXayGQ9d35KFXeYw=;
        b=D0DhlKJG04zFmqIJFuHVKEivIWEdaNtk0hRIrCPnHtXWf1+nrF2b55Fau+AqSn5uzm
         o8fqthsw3lhBlQfykeqMXvYfKRj4sUh+XwjB9v/zknJmEmNCpwyhoHkXcshspSaad5m0
         h7XQ9JUywm684XkI/lKNPfdEmNEeeNbbI/rSA=
X-Received: by 2002:a17:90b:4c08:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b166d1def3mr3406972a91.46.1794333738112;
        Tue, 10 Nov 2026 10:02:18 -0800 (PST)
X-Received: by 2002:a17:90b:4c08:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b166d1def3mr3406881a91.46.1794333736749;
        Tue, 10 Nov 2026 10:02:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d0e16sm641838a91.5.2026.11.10.10.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:02:15 -0800 (PST)
Message-ID: <6a244da3-9730-4d0a-a809-441b76e14643@broadcom.com>
Date: Tue, 10 Nov 2026 10:02:13 -0800
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
Subject: Re: [PATCH] usb: gadget: bdc: Fix potential ep0 BD table leak
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Neill Kapron <nkapron@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261110-9f141e6bc8-usb-bdc@mail.sdu.edu.cn>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261110-9f141e6bc8-usb-bdc@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/10/26 06:32, Guangshuo Li wrote:
> The ep0 BD list is kept across disconnects, and ep0 does not have
> BDC_EP_ENABLED set after allocation. Consequently bdc_free_ep() skips
> its tables before the BD table pool is destroyed.
> 
> Free an allocated ep0 BD list during final endpoint teardown.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: efed421a94e6 ("usb: gadget: Add UDC driver for Broadcom USB3.0 device controller IP BDC")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
