Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3F3D565A
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216656; cv=none; b=MaZoWEPT+zFZMEleLlFCnVkDnLQvvmjmwj2xp1xZZ+PgSPMIM2zLtNERaDeWgIiPGLjOQFJeHe4cOM5UtrkOcrbG/hZg+DkBTZ0upMRtFMeQk3IMO0M4emefZow6W63gOtNnoXin85jkcn7lLjGldhE2m/6Khjti1qRFG9RMFMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216656; c=relaxed/simple;
	bh=0U2bDQ+5IRu4I1tO2PCnTMsOtcSpC1KIoW8zbhSBkow=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jkFNJfgSmPGweg9Q+PdGT+/s579MF0/ilA38EeepxiVwtNZr2Z/41PgzP6UlFSqhBsw0tWX///ffle6+yjcbIsLXun0CA6PfyTDCaGYJtnyO1X82qQwl8EYqi+laf4fdDZZgHOwT8/nz9ETVhtfdRUhjNHB2tTh1+CuFO0oAnXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtCjF7M2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtCjF7M2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37c64c1fc17so300386a91.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782216655; x=1782821455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a23MQiixjOOW4WRBEtyS0bqfPWsN3SOpWsffpg3zMIg=;
        b=GtCjF7M2NygcPTwavJ4f08bnOOsmPDBYbX0xs/mY/L9Wl8Q58tqQrAmdPnH4lGcjLj
         crhCjjME2CSU7fALzugPNUjt/1pJ/l37CYEBGZy40Tkk4YRNfLf5R4Z/oOAPpkaHVPxm
         bGzerFvXJuYwcvKSWRkmZ3pIvOYpYuv94EVW5i58ogrNR0aEkITBrZZ0YFANZdZgW9if
         xatInCYS3iHSMZSAtpAyr7vAWxoVIJL3skpIdu/dnFfg/YsTckXaMEd2YxXod49ny8vc
         BtOEbDl9SxVgCcUlXgFrOu+qK7CinU1R9JfXXYNJztOEYB4kUg5S0SNtAkTSamHicz0F
         GpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782216655; x=1782821455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a23MQiixjOOW4WRBEtyS0bqfPWsN3SOpWsffpg3zMIg=;
        b=oKeSGznWsZgmTLSyjpO3UYxpaiJQshAIAhsjsgLQ1FjoLLBmB28V9pULy9+ExWAkF7
         Ljih5uTgL0XqhSIS2co1ysWnUFtPRzVnGVh79AJYiFiE4LYxtbmomBfv8Nn0sSuxdPAJ
         qOInCaTK+2vK5gZ8zeenKWB6V2F/ApS1OfzS1wow7PdWWh1gpBpMOQ9fzDUU32iYVOzu
         JcFm3rwuIWid1EPbqxJSwffTl7sSgnE7AWz5X1ak3UZlkIDP4VkXNEvI6JTm+pWixBCn
         eA5YeVhMIiScLUEuXS/SWvQePZX06AhjsdHb+Ae2TMd7jtvXZni5O3Zrg5BQOoM1PQ5t
         4m6g==
X-Forwarded-Encrypted: i=1; AHgh+RqgZ9wXbuu5kRMOSdAie7K775qM3EQnJ/NixDyM+3dHf+7p7oowiNxAAxhJODKm89L9jswSyI498JQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9WEOU0iKeRKD6C1py3f818IBK0LK2X3iJa8po7SYCuOCDjYvy
	rYYTw8CSs+pU0dkGBw4Zhp/SPdJ78bwjEO2R9Be417VmHEw3MS9VxfsK
X-Gm-Gg: AfdE7cl5uKmQ2mmSWWLXwhUrnmkSbcyyn2dhvUaV9whP4jGki4FAhO8bpD8GuwT4nSg
	QiaSDlqsy0tXeP7Y+o1sL0cCmS3eUX+0bODjMDCyWX0vhRrPr6O2fZ14ey+SrMrda9qzdBl236I
	Qq7ngwjJ1+eR+HCEkX+yS8ThIpMQcfG1hlxPliLaF572FsIHiaHwvDrta5g21UHS7/IKTH8quUj
	CTx/9IaEWtpKAIuW65VyCSZeS8b5BIiVaKTauTUTVhUSfqGDEFQZ/Tp3gf2ryx82vDULTCufpz/
	bdRFZjMFgN3KkfDupAGQbXg4Lvllsqe5gCQka8h/cSvMNZL7FYUbpfqTx4kUh2E+b7iAxXCJZd7
	COdu7MbG+yza77to1lKlq2kjIrZmr4juCGqeWDwkW1SdTv1kIIuNpzoYYENJSf23jWRtd6s2QdZ
	DAiN+H2Q0YYj7bcsJ3H+IjMJF1/A==
X-Received: by 2002:a17:90b:4c4b:b0:36b:54f3:64d5 with SMTP id 98e67ed59e1d1-37dc9870906mr2271472a91.6.1782216654509;
        Tue, 23 Jun 2026 05:10:54 -0700 (PDT)
Received: from [192.168.1.7] ([134.236.156.89])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-37d1558b599sm12906942a91.7.2026.06.23.05.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 05:10:54 -0700 (PDT)
Message-ID: <8d8a3edc-9e57-4449-822f-3582d7fbfada@gmail.com>
Date: Tue, 23 Jun 2026 19:10:49 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: serial: option: add multiple VID/PID
To: yangsizhe <18392868223@163.com>, johan@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, yangsizhe@meigsmart.com
References: <20260623024108.2400-1-18392868223@163.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260623024108.2400-1-18392868223@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-06-23 09:41, yangsizhe wrote:
> { USB_DEVICE(0x2dee, 0x4d57),						/* MeiG SLM770A*/
> +	.driver_info = RSVD(0) | RSVD(1) },

Hi yangsizhe,
have you compile-tested this patch?

thanks
Lars
