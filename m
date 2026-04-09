Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F80280CD2
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 17:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775755526; cv=none; b=ov3fPHQlU8hNWfVTx8JLEsdXgCnrcu41krNpMd/as65v+u/HSnCErHmrQCrR8mhRIhrKv0VIodbGLT2+cWch1rg5PlZBK2UY05+Sn6jaQ05+HEe7sbe5dNsC4DDHW8nLeYC+zpl/UQcRxLl4yUErkkehUwsxl8g104dACN41bS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775755526; c=relaxed/simple;
	bh=L+gfx4Bqpsx/9F9mWD5tvHyhsf0yMhhmwU896Ja/w4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGaEWYj01CyLl7zWUKoAmpye8IeDhz4oR0gxnqMMP9Du80fUiItpFLIbPyW6OrtD2c8lpHUYk1d4S1dSVUqDRIsgwxMhndXM4caktIN4uEjUKmHgliT8Un+UYm+pQ+3Jt/H6CU+RNck4Utvz160jU2YwVZi9Nz5zKamRwZxLnXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qa1rr73M; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qa1rr73M"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-470145d7e6eso562602b6e.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 10:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775755524; x=1776360324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i68a0+ym1EdN0Esi1FKaKMj3VjkbDFpY9Bx47gnFrsQ=;
        b=Qa1rr73MvKXbCe6HN0Neg6jmTIVZ+y9gYzDtM8hWUaZyH5wsDcWfNzeQfkycw9hRn2
         MIuVw2GTWuPXEhU0HmZjv8YyUKBDCclJk3JfXDoqTB8hFp7p+dcdIrTuYCqr6+QfQRoa
         Brof0MaYee54F2lIjifhFaxT70ILGpzqDDTIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755524; x=1776360324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i68a0+ym1EdN0Esi1FKaKMj3VjkbDFpY9Bx47gnFrsQ=;
        b=aNV57uMOM71jHbcqZT86877y+DeSF3eOsfkkavEgLnHtifWiABHE4IVQ6e2Bywna9z
         jEVfzNe7MVaWfAfFUJIfJ2/wg+Rom6iTtmtRCMD1ot0s/IycPXFgxRljQ6MyuhAuFTcf
         8k+35qUyxDrDmsMxeGRvujJkYPyu5O02QsPoeQ3d5POwLFgXRgKiQ8Ob6njxSeHTP0OK
         /hzUiNfEr3GcSgl3Rmy9EerterTmgLLxjryXwrM81Fl5ZU1kVTgLZwvb17IcIZvEvo8V
         lDf967I3OyvTs8Ae5FAZmoisW1qKoFmgQJkkrEH5T2Oxn/XuXA//9VBBdHOgrPGrnrSF
         8BBw==
X-Forwarded-Encrypted: i=1; AJvYcCUqf0q13Y6qz9SnGvQ+NK8YiINx7WqoHn0iHcTY/k7L7AO5wRc0XladxxXajGmzAR8dGssli8HK7uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwvAl0llkzndqcVyv150ySGodKPcdYAzRyaFAGMGlj+71Q73Kc
	iaci6VGxgPsgnG/dVSw35IUq9bg5xTyUogHbqMeilIAJmFofHlKOUaUr7Ulx62NF5xU=
X-Gm-Gg: AeBDiesx0SDojEsZ8EPUaqJkqGuxnFBp/vWMRJkWCuaJGn83neYElyj2oG7wBod+f0/
	I5OWFTzxmyG2VcudXv60zQbqdQ7uZwMkFpMTeJg0QkxIbEPaRQe6e0tEpAjCc/ZtSE4ZEwVGjV0
	WwTrqGXZGUKEoWI4qqH1IGgAV+5J289uAZAhWB3x7ym761FXMjgIuDZ2N1eVNO8+C8Ff0LH+yBL
	eTM5A22iH1rINLb+4jR5T8iZoZmzE2f9xppBOZo+35uPdORQrBdBAmIBOpHW2bg0NpatAu9k65J
	GAwBehd5A79kfM2mqRVL8IjoUfIt5d+GM9km0Hn2f/CHM7fzANV+3cShikP/eam6QDBiWMb3I4T
	9vtpQk0RhJEnfDOGnB8DdHhByZ9si2X6rx/UW4W5Ijjj80T+VzYu9MJ/Aum3P4vCBfc51PMW2nx
	/JMHkQOo0/Da4rcMGpFy1HqRr5Je+E0nVSRRs=
X-Received: by 2002:a05:6808:2383:b0:467:2609:126f with SMTP id 5614622812f47-4789e919773mr58236b6e.24.1775755523617;
        Thu, 09 Apr 2026 10:25:23 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-478a080d1edsm12406b6e.2.2026.04.09.10.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 10:25:22 -0700 (PDT)
Message-ID: <6dd86e33-6b5e-440a-b0a3-0c9356948c2f@linuxfoundation.org>
Date: Thu, 9 Apr 2026 11:25:22 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usbip: tools: add hint when no exported devices are
 found
To: Zongmin Zhou <min_halo@163.com>, gregkh@linuxfoundation.org
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <8d7000a9-981c-468a-bd4b-60111e0b77e9@linuxfoundation.org>
 <20260402083204.53179-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260402083204.53179-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/26 02:32, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> When refresh_exported_devices() finds no devices, it's helpful to
> inform users about potential causes. This could be due to:
> 
> 1. The usbip driver module is not loaded.
> 2. No devices have been exported yet.
> 
> Add an informational message to guide users when ndevs == 0.
> 
> Also update the condition in usbip_host_driver_open() and
> usbip_device_driver_open() to check both ret and ndevs == 0,
> and change err() to info().
> 
> Message visibility by scenario:
> - usbipd (console mode): Show on console/serial, this allows instant
>    visibility for debugging.
> - usbipd -D (daemon mode): Message logged to syslog, can keep logs for
>    later traceability in production. Also can use "journalctl -f" to
>    trace on console.
> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
> Changes in v4:
> - Printing behavior adjusted as suggested.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this up.

thanks,
-- Shuah
