Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3472A3E51DE
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979710; cv=none; b=Fq1GgtPE7tWC/HbkGOvHEL3alb7Nf7AnhZv3r05zUu2KmfKr35xillCTNvGJyUO1QJUA17TEUYXGZ6CAjabF61y9jybUsT4yBPUvCfuPO0CeF8lhAGyo39abgZWxCG0xNpcQwiXarFwltYhmTqDKT4CffooRx+7fE1gNI/IGFOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979710; c=relaxed/simple;
	bh=pwiVFkeQnCttoDbb09pbQ4jq5kWqQHsBcVoqyTATkis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhdrEPzw+kgdbuCqi+b/PPe9g6oixNSXMqJZr31FevQnKEP6MszXeYNWd5q6cJWcbMZqqTYF2LSIG43Ut9NYGuXMAFtoCg6bQUcEO72zTB/6QqT46FO7RGRdV6KKTogd+whrkQ73+xTsWV38bXR7xZjPrRSD3IwJbqbQKAeWBz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z8WQ+9eH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z8WQ+9eH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4758bd3731bso216257f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782979708; x=1783584508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uS/X0/8CmnUDQ6B8grMHPvwwaVFQGYkdZZB6z5qqXrM=;
        b=Z8WQ+9eHsEjGqg7ZuJUrrBdhJ3MUFucdAa5iPH49ir7LBULtNgMdcozF8mwwGQE/jy
         yU3vERqjlmrsql6GyUGGD38dBzgHnbcTaMRFvumui+EU+SnuJAID/Oeezqtce+umtuLn
         DzrS5z+vjqmTVkizKtVoWE47qDYYV06AZ5xH9Z/h7j/qkkReFFHFeIyNMG7+H6JY4iXP
         szzBoeCTSej7sKXmIZ9dNVpHu+vp6pcp25vZ2lJ8CY20H3COCdYdnfwW2nruMQSvURT0
         OqBFQlnNMvpRzyJwbpPZoQ8w87vtg1VjUWJ3S1vh3UFHAtepmDuIZzirVyzWBcUp45nt
         T5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979708; x=1783584508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uS/X0/8CmnUDQ6B8grMHPvwwaVFQGYkdZZB6z5qqXrM=;
        b=KsJW/pwA11o4RZ/Td871JaMzNB26i1KMOgYI2VdLDRKq7yIsOEmRRHTIvOotZ7p1Ug
         yi1OP0ni0IV0io1pgkOxCUYr7PXvp6KlZUVZNpw8WbqkSEEwxSVysiYd5s0eJ18MhcVx
         gdnEEgOKroNly+6buNSVeMDZkJi36RMrhTRwfvZP4gsbNExzePZBd2dPb/995Pf5Ocba
         Ri3AM3rX7yV+xrRVdFG9kuI9k7g/NhZaqJf1q/Ph2VTwHhtwtPXyk2xZMBjQOZkPI7Tw
         QYQ7BJJXLSvMbh76lSItKKNi1ZCN039LrNbGnj4XsF+9E/J5uYo9m52u9pheDxuhQsSq
         l47Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQHYlgquHPdGPtmqIhUpAGXtprvPWZKjW3JooAVG2P4URJKmRvC3/kYbE7ZSNXQBjHUBALb2E7rgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOas2OZQjYr8LhgNsBJCSKhbfWP41oJKIrupqobGj7eTpA+Kqm
	4YCLQcE416WbsKnK5V8aqyvRBNlXhNAPHgrny3kC13+PxtrmMV+t7Fyl15wO7+DxEfE=
X-Gm-Gg: AfdE7cmgNtTLXP23rZxpdif2r6WhHEpVK49Ozzqrl65KKlggHd+0QsK0BuiufQQJ47X
	tw6/+oiUsHHE23PXg2fEp71lcfyVpVVWVnlp+fpkOGMksitTyTY0V3a/Px4Wca+kyCZxc6RheFu
	nhYcbzMMmFM8+rWH1/uaNy7DeEBJDtuAUPSIffdVJsZ33Rhhsb0c1sk5wYPuBnR1rnKtbyCYo71
	G0xWXHGNV6nnDWIrHQZWgSfstiDUUg1Ks2eZqvXtbkJrQFT3afsc5T1BKdAF1z9TUgnwkqlsjxX
	EELu2zS4mIbKvFIVJD9WQdb8Ah0/zrQ1mtdJebZeCvodLs0IjLms/btyZSjfz6XBClXROHjttlQ
	higc53XsT46+Ob/xHgqx9F5bvgdwkCxyZvtVookexN8hjqJSkTMl2m99xnxw4ewWs2Q/PGUlkzr
	wjNvFoPiUooUdqtgTKCIEZIAoCMHh+mR+ZFy9FcMsqoao/eW1dL3td/ll3
X-Received: by 2002:a05:6000:2203:b0:473:536b:5d1a with SMTP id ffacd0b85a97d-47743d71b1bmr6959077f8f.7.1782979707557;
        Thu, 02 Jul 2026 01:08:27 -0700 (PDT)
Received: from ?IPV6:2001:a61:1344:a301:8020:436f:b412:795e? ([2001:a61:1344:a301:8020:436f:b412:795e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm6769213f8f.15.2026.07.02.01.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:08:27 -0700 (PDT)
Message-ID: <ea2e824c-dded-423e-a242-56b9860d3430@suse.com>
Date: Thu, 2 Jul 2026 10:08:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [usb-storage] [RFC PATCH] usb: storage: uas: limit consecutive
 device resets in error handling
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>
References: <20260701040335.810297-1-senozhatsky@chromium.org>
 <e2599d9b-5dd9-47db-8339-f1aa825a11d6@suse.com> <akXJuqvHLUpcjXIv@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <akXJuqvHLUpcjXIv@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02.07.26 04:25, Sergey Senozhatsky wrote:

> <4>[ 750.651133] rq: tag=0 hctx=0 op=WRITE sector=13860872 len=524288 age=76536 ms pid=11900 comm=image_burner state=D
> <4>[ 750.651205] rq: tag=1 hctx=0 op=WRITE sector=13865992 len=524288 age=76536 ms pid=11900 comm=image_burner state=D
> <4>[ 750.651263] rq: tag=2 hctx=0 op=WRITE sector=13863944 len=524288 age=76536 ms pid=11900 comm=image_burner state=D
> <4>[ 750.651320] rq: tag=3 hctx=0 op=WRITE sector=13862920 len=524288 age=76536 ms pid=11900 comm=image_burner state=D
> <4>[ 750.651379] rq: tag=4 hctx=0 op=WRITE sector=13861896 len=524288 age=76536 ms pid=11900 comm=image_burner state=D
> <4>[ 750.651437] rq: tag=5 hctx=0 op=WRITE sector=13864968 len=524288 age=76536 ms pid=11900 comm=image_burner state=D

[..]
> <4>[ 812.091136] rq: tag=0 hctx=0 op=WRITE sector=13863944 len=524288 age=137976 ms pid=11900 comm=image_burner state=D
> <4>[ 812.091194] rq: tag=1 hctx=0 op=WRITE sector=13862920 len=524288 age=137976 ms pid=11900 comm=image_burner state=D
> <4>[ 812.091242] rq: tag=2 hctx=0 op=WRITE sector=13861896 len=524288 age=137976 ms pid=11900 comm=image_burner state=D
> <4>[ 812.091289] rq: tag=3 hctx=0 op=WRITE sector=13860872 len=524288 age=137976 ms pid=11900 comm=image_burner state=D
> <4>[ 812.091335] rq: tag=4 hctx=0 op=WRITE sector=13865992 len=524288 age=137976 ms pid=11900 comm=image_burner state=D
> <4>[ 812.091381] rq: tag=5 hctx=0 op=WRITE sector=13864968 len=524288 age=137976 ms pid=11900 comm=image_burner state=D

This looks to me like the block layer keeps writing to the same sectors.
In other words the issue I see is with the block layer. Do you know what
triggers the error handler at the very first timeß

	Regards
		Oliver

