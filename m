Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B64A8422
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466325; cv=none; b=TzEdO1Jj8jZ09NLI46bGVbftFrZDztAS4E2WFaxoxDf2gn18zKwL1d7AIaWy78V0yOugZR15HM+o3MdBsjemPVbFrD/dtOz7Q2yk0cDiozkUi0AqqSavlK2sSyAdQp+DucLpfpnSbWGW8d/CH0ZWDszLHl2uU9B414NrOBIO1PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466325; c=relaxed/simple;
	bh=Q4bWILpty64faa4Itg++N7wqOYZAwlwGZPLJbsqOCU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hu/nKv/eRer814mpwm2xhoshSHaGsbW7Uz3g837Sb4xOgITOb7usP4r9lQuluIEBlvfHkcSreAssJLOpyb4lre4QdnryJDTzarR6QQQ34/bh09ljp6U3XkFCua8/VmI7MD9xaTEwj1XxyWLEY7wYpKCJPQJW0EujyF1FH9VgrhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LuJOTTFZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LuJOTTFZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so25995955e9.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791466322; x=1792071122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EF0ORxL9xRoD8kTXGFBu2omdDiiROF2S9Nk6IzMT2Xs=;
        b=LuJOTTFZsqidX0nbStyM9iRdRhHlv4YXvTfjxkPt8Zwo6ETbE1LapW9svivhat3xcT
         t00q5dxRW6+ASmrDz5mAWfF1yerAgDFIaJrup8JXKdlVkusLvVaFlhoT1dUPjK07wIHq
         lSO1O4WebEUDdfpFJVShYsqMIJQmPhft3rvAjsRpIchXHZ+zn6auWlZz4XHPVODsXFXP
         hV7zm7QYrOyQFo4UsRsJbba/njnEEhstIIjtu0CaqsxiA08kvGLvoVZ/nJymmHFiGHYZ
         juOvm+COeUlFuZdWUVeReMvdJynLJc5xI0+EL92EwrwEu/biry/LcGU9jgcJWnq/IpzW
         dbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466322; x=1792071122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EF0ORxL9xRoD8kTXGFBu2omdDiiROF2S9Nk6IzMT2Xs=;
        b=nTpQ57Z1tkjWyvvSzWSDjmYaCF65mBm8mByl1P45lITAnqIz37PnpcO/Tx+Vokq62k
         Sc8MnZXZtpSQdU5XP0tLg6F02RDTUV1bk9tLlr4zg1l/4ZvkujeXupl+XRqFsYoYXUie
         7gpAJbFzS7NntbqIM6BZ0wNBxBMcJq3twSDarlRqhyTwWcR+GmVgLHbh7jWfZqxkNLnq
         Me1Y3/NwX3ZCQx9Iphc5ThdLxZMbBxyaVY7NlVrCWAW4ox8x+MEiC3C73O/eEU8Mur0g
         /4/3P47apXdEO7Pk7rZPmxEaUBUCYd1nswAEOXS5I37GAW0zutmOY+SYqAMe3tgQFXmG
         xLrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1wsNMJnmwn5pdvbymm0g2j/O1KdZXpuYDqOrVrOrFjfP5DO6lF62JZG23kh/cLR7QGBpOMtcnTns=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7ChsH8EK6dZpOWLb9dyiqvjdYS23c35QUE2SJ3rSE7moeAgxa
	bU2mJ83thLFjk3F46k65RMF7qcKfuWilOVbsyyu3M1uEAA7nBqrZ2X+XTFqok9ZHA34=
X-Gm-Gg: AYBFou0YBXyx0eWU5gWaHLKJzZ+u8ImLHH/VHTKW6Cb/4c1osM1PswiwAi3Z6dFv9Ko
	GLirbRVSE99kwX5OmA0HOPSOJfhuylNF+kShPq8aBlhsN7Slj4k3AMr4zLm1GwN+KRctTusnUY9
	Sy6xSBLrBkFKKfeOOLXNu4qxFt0yfYGYQEM5y+nxAdb1womElmm79weCcS1zx0aIjskDxzSrK/p
	ODAdhqqeQ06ULNX7b8y+TrHmQwycKwNKW/unaSQ3SUKvLqpD9JAC8/jeilcB9l+GE2VSI/oUFn2
	lEuxPz1Sh4rYHDT4bvY41j37lXTnRnTru+e9VvypPc5N+TQg42u9iq7W9nHOpYxcmf9RNWsRt6v
	LmcsZ2/7m1/eXiODfsIzPnDMcBEl0ZO8FN49QiQlS62AV32jbsCy97XGz7AzSzD8B67tjSClKTx
	6G0J4U/T2SPntumqONugMIYUc9kfkrEM4nMUx8XCJzxklPWcvoKKIp2VLp0/I8hp9R233jzlhf3
	vFUGelqJ0n66ry4HWfuHJTsOB+jB4raLqmCyO3ibA==
X-Received: by 2002:adf:e19b:0:b0:48b:ff5:d297 with SMTP id ffacd0b85a97d-48c727823c4mr10620890f8f.25.1791466322023;
        Thu, 08 Oct 2026 06:32:02 -0700 (PDT)
Received: from ?IPV6:2001:a61:13be:f901:8903:c5f1:e7c8:72f0? ([2001:a61:13be:f901:8903:c5f1:e7c8:72f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b53fb7sm8309301f8f.58.2026.10.08.06.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:32:01 -0700 (PDT)
Message-ID: <c2fd2fb5-0fe9-4788-bcd0-bf7d09c1b5d4@suse.com>
Date: Thu, 8 Oct 2026 15:32:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] usb: uas: implement .change_queue_depth to allow
 per-device queue depth override
To: Luca Cecchi <luca.cecchi.info@gmail.com>, linux-usb@vger.kernel.org
Cc: linux-scsi@vger.kernel.org, oneukum@suse.com
References: <20261008112645.1820678-1-luca.cecchi.info@gmail.com>
 <20261008122604.1862534-1-luca.cecchi.info@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261008122604.1862534-1-luca.cecchi.info@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.10.26 14:26, Luca Cecchi wrote:

> 
> v2: guard against devinfo->qdepth holding a negative error code left
>      over from a failed uas_configure_endpoints() call in

Sorry, overlapping mails.
Please drop this part. Sashiko was too nice about this issue.
It is a general bug. qdepth must never be negative. It is
a general issue. I've submitted a patch. Your patch
just hit the issue.

	Sorry
		Oliver

