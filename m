Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419371;
	b=jvvWvrvia9FCf8Jc4f5YBsJqdgsLFT6HaJo46jEnlbAzcCThzk3eXEl3s+PRdGgbqWbd
	 sXn1M/G+4F6pm27nLv6tIwtP7ZNBcFQwdMSg0QLCjzENna62xCIMZ/yE9n5ituIE+/gYx
	 JhLx/491fwW2zk4A8AkaEHpBJtMZuk+iYKPWVBuVXAcBsH/ve1cGNzELiIvibCgk0BnP1
	 hg6pQQ3vVLPU3/bs7wh3SGGg9TlXdVQi41o3uwUFXSjwnOSmSulDgBSqrcqjlJSCZaErM
	 kTQjcudk5QecFUYvA3M87gDy8DmljjG6N6cwfiWT4huqpSaThE0HqN7BDYtWnVCwmYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=P0LlEVmtKbYkhBHowVJUvrAVEwB7x6mCjbop+wAsjGs=;
	b=mRtWqKuDyXZQmh64taA7GAPxmj85FOs/46YxOFhK0MD1Zxha1BqmhDJGA7ZtS+fIV4f7
	 yHJWI4qVfdpBt5vyEH30SAGeblCHR6rq7xQQmgN+zNUUUqYRt1rnqL7ERloDlxhcLIzLR
	 2s0CTovKvcwa3pFqqDW0KhpvNEWmxVWqDVYPpQTluSO/AmDoTu7zNob6y6O9EeKRsDBE1
	 rc6OBE9k/DRLJc0fSww7kee+UFnnF+ezcF4eZymj3cuz3euvC9bjciZhkSQYZNUsd3T0z
	 w9MsWfhumafZLLYysmVV4D6Bfje//5uey1ucuscec/T6W29Sx3pg2bHmsMoedrXHYMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmWdrLTA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDA7606A324
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 17:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCDA7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmWdrLTA
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6052481eec.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 09:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794419370; cv=none;
        d=google.com; s=arc-20260327;
        b=hcWf3i5kWmmRW3RC6A1DQFsAq+CxWgZ6VsOsBok7tg83ANMUnUQ78aojnsDeJz+f7V
         znkuv1J4BvrDnmlRNz7Em+XsDznTAIk+fUx8xIYCnIY1BxGgznGbdfy4C2HgG12PePfl
         OsqZJWVrRhbYowzR1I6dDKnkcUJYjZBIRMZT0/mT7h7CVvhp7UJ9Njhi1potFN5rGdLj
         jh7qbYpBobaQDMPF7hpF06tk89RHaPig+qebiJki7m9acxTT7tx8xL7krdvlYcxOn/hF
         y3AcV9N7TLmBJfIjio9ehp6XAhZHMnmlFy1yjw56czAXmc7euUzYVOW9HRnFD+wzCd6U
         gpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P0LlEVmtKbYkhBHowVJUvrAVEwB7x6mCjbop+wAsjGs=;
        fh=yFnOTL4WJ8bk2mLF4+LHGzZlQiJjZMqErTJfCnHjsIY=;
        b=MndB4/T9dOdK7RJGFtWZHHHgELhrXElKqxHSnMdShV7F81XZRzwZiblCNw1tBBSwPA
         ZWVnZ6fyaLgwMENx/7c77hpBWxjvv7r0Qok3Ob6CSulCvH96nV9e2/yfrecd96dDnsMl
         Qh3pqMXM8EcSH6oePUR+LNNoN08klnFChZLWeL0iGuitHcNLkySqqDPdtwRpdxNpQFxm
         AxFEdLzjNv+xoE0GB32vAEfvIxom1WOTZSCIbGI0fXf8sVraBvfBoJevProOH38AMGxS
         CdDZvYrayEL+/K4fq1Up8BXeMe46p/P5fuRKnrh1zzYzflUPepG3ee4XsGdPyPoGALNH
         +VEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794419370; x=1795024170; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0LlEVmtKbYkhBHowVJUvrAVEwB7x6mCjbop+wAsjGs=;
        b=WmWdrLTAMz51OJvfqBlkxREe8w5ZZlX9pq5Mjk5ePhW52XUz38wj54Wyp/6Cr+DzGx
         JE+M3cZnUA7GzUAg9Mh11pxcBWfvK8CNRumwG+ZBobsrVgMVIhNFrioxpuuNf611MGW7
         M/9qJ5zDbvTzNUbDPk5V4iaDpMjLnici/uUiv5ZleuEg0UHmdhIDV2GKxkU8+12wPyr5
         E5xPiVS+YqxcGj9LWIPoOdIkVgnjzm4LBAupubZHdmjcSeDd6e4k4H00WJsHnKyUW8Qu
         7L6pqAG2oymoUQuCLLlGG4XYXywN7E4TsjOwfyhs0yMcG1W1y9TlGPeW6JUpjOVrSddl
         M79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419370; x=1795024170;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P0LlEVmtKbYkhBHowVJUvrAVEwB7x6mCjbop+wAsjGs=;
        b=k5YGMRPhTMTndbVgnrVJteJObBkwQAAft2Zd7oxtCC7jlW7SCh0oTHFP23VjZMpaKm
         wa12plf9REwiO+Bd7z2cd5j4KnBZz0rBDJS/Kts0sjvhxOktntEDYUmsRBFE+VJapFXq
         tKHQmuhYKC9BwOtwkHxCBpVko4bawnlt2W2RwEP2ItJDiVWgJc7WCYKNOs0elIE8YQlo
         jy9lBPXeSSpd0bVVK5DKMoxPyuNmaxu//Km/DOkvfeAqW6VljcC2Q6Rqs1mAxEIq5IWt
         0l1gc2lRkSO6zaE5FbOx1CKK2CbJsTWvk5rIK4RIeriWI3OLPFsYVoa5oO6Nljz65gPp
         QX0Q==
X-Forwarded-Encrypted: i=1; AL+hErE2uGiADMSGYKaxo9o8q6Qtc7cixNrVUNjiwqDgrig22FmuO8mQQuqlYa5S7wZy6I5TIF8UpdfHuM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9smSgKLhhZK0TtGe2/1MRnx8qqgf5jfmZvxI5wB2Vu3qbBeIF0
	Q3hbi9cjLXU+IEz/QNy228c8/HpCg8pNl9ODfyaoxf7EQLRcReddaM2XpN5qAeuMaUeMDMz/587
	YcEmQbJ+/nBtChqE5XfCH2TdFE3QuBiY=
X-Gm-Gg: AYBFou0NgnZIkTLNn0ldoHVA1m2irWHRfdMbQ0VU9bxLoke3GCam9HCsh1imkChSCkB
	q6tAov65OTTXRiApY10qvcK7TchPlv/SaQaGug2wEdqsC+REPDOv7SyrDX33CIg5sraE55oZfyu
	EtkAQapc539kug7gcJKWz/5OAjUv2ExrIMVctmbGqYTvtSqsLnch2LzpjbiW3MPK7HhZdSrHrB3
	CCm+LWoSvheiPn3MjzWbAnsssRXtZ77XKfhFS3eUwMrN8YYoGqUfSiwVev8U3LvKW0c65Rzw0gU
	WPC7vYm7dDMghOWK//gGs3DViMaspA4GIz2duEQuxkZJJgBM787U00l8o3MuOzVUtxMQ4kOyV1E
	9bQSK8h8mWn3xbmfN82U5U3Yw+dauujBjQb/obPuQHuHUDKAzt8Ik13aEEvRLNqAczxPox2u3An
	ugNjc/XE9catlnPnWjQqhNNbNcGw==
X-Received: by 2002:a05:693c:65cf:b0:375:fb27:2c59 with SMTP id
 5a478bee46e88-376861744d2mr3628461eec.20.1794419369880; Wed, 11 Nov 2026
 09:49:29 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-smsc75xx-rx-fcs-v2-1-216a5f26842a@gmail.com> <e4a20579-2576-4c2e-9120-b675a175a1da@lunn.ch>
In-Reply-To: <e4a20579-2576-4c2e-9120-b675a175a1da@lunn.ch>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Wed, 11 Nov 2026 14:49:17 -0300
X-Gm-Features: AclHuK9J4PRZYynpn60Trwp0oScnHBsKAesx94T00Mrc6mS2wm4jqy4_tDb4sVM
Message-ID: <CAOCBhwE84F8ZTAVXwxKEpZz06q3KvD12FkeXp6Nn+MXoUYOWfg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: smsc75xx: reject frames without a full
 header and FCS
To: Andrew Lunn <andrew@lunn.ch>
Cc: steve.glendinning@shawell.net, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What is the value of FLAG_RX_ASSEMBLE in flags?

It is not set, smsc75xx_info has

        .flags = FLAG_ETHER | FLAG_SEND_ZLP | FLAG_LINK_INTR,

so usbnet counts rx_errors when smsc75xx_rx_fixup() returns 0.

> Should rx_length_errors also be incremented?

Yes, I will add that to the new check in v3.

Thanks for the review,
Joas
