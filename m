Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C814ED1BA
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474433; cv=none; b=FRq1+VkmHMuLffMHcE+xvZT2QJTYcOIfb1p4zPqmG8bYeFlGPAZRJyzaIuDuMLiymrIkJKD5/nDb8cnBp+7xB8nn6/L1YY10RMCt5GzQGYx+Cialvvrz+3EMGobY4fEiF1rgj6xr68USqTVZwx92HHCnGc05GYfrQ7BEgSKo5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474433; c=relaxed/simple;
	bh=Fv69M9kf7M8P9lf/EOlij8e5fDTE4UYWx31vo2P5D5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwL99Bqupj90mqdg3vkq66Rpj75eTv0JJOFROuc76BlAdYA+Ob/IuwWtQnJGTm95zn11kpxjTHBhIaI0AgOOmkqfxlI6eu51fV3bFKikLJLr34S24KugI3KySUQAidjBVhQNN9p6VCG5dV/KILG7O0dJfYYjxrR8debVhIshs8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUbiEFyX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUbiEFyX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so53281675e9.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791474431; x=1792079231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fv69M9kf7M8P9lf/EOlij8e5fDTE4UYWx31vo2P5D5c=;
        b=lUbiEFyX7Lo+LY5qtpIDeeTxmJqTmNAKPF0GUIRw1rA/tsFq8y/f46Sa3vBHfH1Wi1
         XIgkSkNe4T4jESOuTCRzjxhr3xm4RJx86Hp0zab1bufH20QhBDHS3Yc3bxGZBG4x8O+q
         sxhP8YF36B9bE77m+uH66ljcu0sWVQr/95MpB7shoevYPFB+FZvx24Ra/7Cpigm9SkmE
         O5JTga8/cU2V/1CEwEd4WgQRyTtD3s2o0VIykGwXboLmnnuky0yfm9R9fveAHfKnpvpQ
         itZtZSMvamorfhSQ+IUvlBoTeVBHw7/52h7+izITm7KADSpEIAAdcX6Stfm3VxyXFOdm
         X3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474431; x=1792079231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fv69M9kf7M8P9lf/EOlij8e5fDTE4UYWx31vo2P5D5c=;
        b=iAj9GeeWBgosj6d8Uhm2DOxPMqYAYVPiYtKSBp+33Hz/Bb6OTKLpsAsW9lDXXoNVWh
         EXoPKvkdAi4d2RDppnTcmDm0hNdvwPjeKxY7t6NOxup62qCzEpnW+KqxcG+YzFR8pelx
         EpBMI6kXFckWoEjeFYN0LhaWZXoNQt17eC8moTcZNN1zOUaeWr7FKbM+4qN8FvNo7HXR
         wAzp4881d4b0FcX15EUvD9ZYS+N3LolxYoxjawrnBZCBukoe25+GwF7hdgK5skPloy0S
         mioZFWO5wYBpIzq+6A8tlY32C/qs5Px945Q4zrt1rcs2MA1D5/6VM5GWtlReTBV9hxHW
         Btpw==
X-Forwarded-Encrypted: i=1; AKwUvBymmMVYfpLy2pX4DpZTY4HquUanJONz21/L8xT/8A6TFZsF+mjS24N+ewoWwIGwhI23sAbPdWpGya8=@vger.kernel.org
X-Gm-Message-State: AFuF++kCzbt9IMfOlQEk92sjgEW2bCdElGwDb6yImUWNJZydQR8mLQCi
	Evlv8pTzMQYMn5ECrcDDyO2cjTj6OWIcp1h2EtK3lLGcNRjZp1JEPaVG
X-Gm-Gg: AYBFou2ZvG7Aq5ypijzj5nIR/TzU2k7vTBfl49gNVtWHzDmZCzSKYYpYaXvO0vSy0MI
	cn/8ov+1mEkmwaHn6Wnc6pJiqxyo+jS75MCSUZkA4LqVPaLh3TrBdnJ/qQHvOsgUFr9bc6F5MNQ
	aaih5zM/06bTj2lSFgB1ttAOf8twXKLhYmPaPYiQVQw1e+BitLOQW9QXzQq+JqGt7LS7fO7uJeV
	5SrNy9Yz8xPq0LcAH3OuF/9VEZwfxB7EphvuQc+jYcHa3jxDcBRvhG1h4q0kJXw+ufKFP1fKtxc
	qTduOs2fLCIilOKXhQ1X7qEFwQdZ1wVomyBDe9ABYFXmW9qnN4hV7fOIZimjZGmuAHnhCMAYjbo
	CRh1bt017HGPBQ9F1mp3+nnquUKd5yn4Qj4ALCdSw+iwGgRCzaDDFFQEq3aonMR+QsQJRlexgsT
	se0o4VLBlzUtC7j7IR9xu2NpgofKvnbJHVGB1+WHwA2PJ06ro89hRVo2oTpy95BL8aqEUVF1KXd
	uT9n+qb
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-4a180422c02mr105584275e9.10.1791474430445;
        Thu, 08 Oct 2026 08:47:10 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db652194esm232749f8f.24.2026.10.08.08.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 08:47:10 -0700 (PDT)
Message-ID: <6cf2ac60-a9e6-4a2d-a7a5-7535441485a3@gmail.com>
Date: Thu, 8 Oct 2026 18:47:07 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
To: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, oneukum@suse.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007220311.113827-1-omermetekaya0@gmail.com>
 <179141094859.2527009.4935200551311639225@kernel.org>
 <20261008084012.53e34d5f@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <20261008084012.53e34d5f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/8/26 18:40, Jakub Kicinski wrote:
> Hi, please answer these questions, and try to include the answers in
> the commit msg of future submissions.

Hi, I couldnt add reported-by tag when it comes from sashiko,
should I include the answers under the "---" for future submissions?

Thanks.
