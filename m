Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410135;
	b=i0blolixbf7H7jO3zPPtti3o2yxhaPl/tCrAM9yclrmIaj48TsaB4iFcUL1CN+aPnLmr
	 Jz0/a3gHTiURbC0qVhyPtrJijeUWiHFKyobxSZXaVVqwjLusdkIc5gAYvDTXEzRdFJNE8
	 W/42ClONEFvn+X9d8QibCeJkoWS+0wR0Qduc4rZsiVEuHKKv3wnTcFUnj65JZvY4qxNso
	 gv9Hl86qeAsyQ3VZ11f9+TGcCxOUQiUvS0PQLX5AvBs0wHPn003aTf5CnWi+TG/q3WZqZ
	 zYcf3HWH1mht7kzK+3hmuh7eZe67zR8/kLgPghhAhs1YqoZmeQd1x4UHWAEeToonFmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BV1EuO9aVqSWMCLmaE799g2faQ7td/sexJDYNT2mXKQ=;
	b=POGlIV61gYyFjnZFfQu/tuLiOfhofma5F0Ezdeb/XqJf1rn70h4eEAR/83p8CLJvSU7b
	 WhKjVFDs36bUOrr/wMBwBE+B9o/5ff4+0EePEgj2DwU6JnhjN2R6DbuffR+S/42NSLT7+
	 85pfsbzg8WYMboP39Gj5q2py2fPfJSNwy9UyvWhoh5WgEnZ4EnJs4AEQVyDiXBxrrADMn
	 +9B+yiPIiaPsZnhda57YHur0AtlMNnsrr3pfazowcO/tubJHFXU5DgD/9libGIOOoIGaw
	 tOOoc/9D/v4AQZMGfg8zmmlbh/Rw8FQwXe8sas/sqG+pRvwbaPu+MydbAR/JgYle9/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=A9XupMkI;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757EA606A31A
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 01:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 757EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=A9XupMkI
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1807973a12.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 18:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793410127; x=1794014927; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BV1EuO9aVqSWMCLmaE799g2faQ7td/sexJDYNT2mXKQ=;
        b=A9XupMkIazH8/z7k76jOmcLugjTp5DBZvmMrqxX/2Lhe+Wy4RIV+tmj4LUgqU7lJ4j
         nzUAgX/C1VYZoNf6VEM1SDnaiduSz20LoudYapZFon8YyIWi+uswoucwZrKkI/ZZIbFO
         gYW/5xHdjnzujiTEfKUJ8wLuk+nCD6y3L9gTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793410127; x=1794014927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BV1EuO9aVqSWMCLmaE799g2faQ7td/sexJDYNT2mXKQ=;
        b=FWTTV1NYLHyw5PpvoSSs2YnHJh4L+GqBmH2nIbLbu9LrawQEqC0Rx+pc3loVE49/jY
         jpz4mLtGY+87hUmifJyV/BIO17emT9wA1D362ALmjB1g7LEyvVrPJ2XxkwZm9oI1uDg4
         /Xiuq8Jjji8rxZi7+irNp9KKxwhIlRc1FELruPARe1GfIfwJCNd52P4K0Qs+BNhxg0lJ
         w3NWMIHWLA0VPl8ph7B42w/OFH9hnCA4LMcksvV9koW1ETx9o4jnMZCkh4PkTHDxkiov
         zUsrU2R4TChWSJtFhilIhS9UsD/mJRJF1b8IJDccDYFFP+LaC7GR/flEg8iXTIpW+Cvh
         kMzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/5WedVIeVJGtjYj1lqadEyOuNLA1fLC1yKb9gYWM2MixUjJygxTR/NK02djWy/5UKRYmngGZarCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl8sWdUuoGnfw98rXt7CMqs3MuVP/X1BV4lXnbAbe0zKpLSeks
	AXwzvC4Kixk9FKZ0Uu2F0vdZBz7M2BpMmbfLGa8ua5nZE4O5dULVe/6LZzmLWCs1Xw1gsrp5rXT
	M/1jE/aY=
X-Gm-Gg: AYBFou1+HKsocT8cN3HljQaM9VeBnMv5/vaNW9XM/+B1et7Aqr4A5j06KSxURd192Wm
	hGpx/eBqmWCwKRM3jf2RhAhEMusIDUJ53fdV6yiv1ESByiOp1/Wy79rm9ppkcXZGA/fQZbvnxpl
	cqEOzbmSOYtkucWAK2XOqN0kONwMFlL7O1I7TonUuqedRDDvpThixESDBjdWDZaHSGmHDC3tZOK
	vPhhToedgGRv9cGFDwg8zg6XSXUR+VgQrwRHDrbRhIdjQ0Y7smLMYruBExN2m/XSSIPrq87ciTQ
	sHvQcUXf+QC4h1qx7Sl54SZzibYL1Kvo6AOy+wdeWIZGdbFnIzlJTvsdWFm9LYa48MxsMDbsSdY
	uNOkQUMqPv1Jv9Zy1Pe641bURRIToOtIRozAzgLJJEKgPDyQW/TKsHkuk989rbRUNR7eahdqhy+
	PgqIDBGmEflTZpCk6oWDUsXV1DwonbzAk+WAeQrCOOa/T9pTGvUP3XbhuZrcknaugEhuEvh9DpP
	a8ru4k/dC64MF0KVLioehUqKApXRz/N0u4m/BQcbbTkeeye4KHfCFBGfFukiIfcyvitiEFvR+Df
	ZFLm+4Bv04PMBLu+SLVvUm5tG1ULL13n6BC0ev17uZJZhSrH/5Pb6T21IokQ8/2kwhtnjiqSG9x
	ify0=
X-Received: by 2002:aa7:d886:0:b0:6b1:cef8:609a with SMTP id 4fb4d7f45d1cf-6b4d562e7d0mr2061924a12.38.1793410126810;
        Fri, 30 Oct 2026 18:28:46 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcba5sm534980a12.20.2026.10.30.18.28.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:28:46 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso1869004a12.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 18:28:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMVeyyOd3H1ivwk2Gf02aphO3zXtGHMsOXF3IGgq/6e8+UAvBNXnjzR6egUIA/pAT8WsRcGqa8umA=@vger.kernel.org
X-Received: by 2002:a17:907:6d0a:b0:c49:1bb4:4cc0 with SMTP id
 a640c23a62f3a-c4ca7aef250mr362396666b.14.1793410125839; Fri, 30 Oct 2026
 18:28:45 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atoUqhA4O6NAoZ7T@kroah.com>
In-Reply-To: <atoUqhA4O6NAoZ7T@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Oct 2026 15:28:29 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
X-Gm-Features: AclHuK_g7GOfHDoSD5vxxQigoKOR8EUt0Il1gVq72Xq-fqVjQqnjSsB4JYmNx14
Message-ID: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
Subject: Re: [GIT PULL] USB/Thunderbolt driver updates for 7.4-rc1
To: Greg KH <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jacob Riff <jacob@riff.dk>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 03:53, Greg KH <gregkh@linuxfoundation.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.4-rc1

This commit (254261381538: "usb: typec: ucsi: retry init when the PPM
answers early commands incorrectly")

> Jacob Riff (1):
>       usb: typec: ucsi: retry init when the PPM answers early commands incorrectly

results in a hundred and one lines of

    ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get usb role switch

for me on every boot on my laptop.

Before that commit, I got a single

    ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get usb role switch
    ucsi_acpi USBC000:00: error -ENODEV: PPM init failed

but now it apparently retries that thing a hundred times before
finally giving up wth

    ucsi_acpi USBC000:00: PPM init failed, stop trying

and honestly, this all seems rather excessive. Retry ten times a
second, for ten seconds? As far as I know, this has never succeeded in
the history of this laptop, and it has no bad effects apart from the
silly messages.

                   Linus
