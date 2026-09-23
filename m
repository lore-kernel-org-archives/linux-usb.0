Received: from mail-wr2-f30.google.com (mail-wr2-f30.google.com [74.125.225.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A8636B92D
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158062; cv=none; b=aNw7pXjJrGyjplQMMpmjwY63Mmacfat9n6gKktdHrjatknPESTUuSr4fZhGe7u0QM3+j+om7kqlOjpEFI5PAONxSQEj8gwcWufODDMKBNmasosF+EX32WEBzdEGE9ZsQkfNL0JwbWzdUBLKm6nBCT+5sYk/3R8H8zZZ3989I01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158062; c=relaxed/simple;
	bh=oF4Kl8JfVhfUU0dj2/ZVkmxW4BeWTvV9sPnJQM3i1Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIEWQsvZdzCf2/feb6ImBPm75jtKsizPLLc56pRnr5bV4D9L1A1W+MMcSiLHVminWftiKr+WGM9/+xEsbAeHzQaeqwB7pmXH+nqwhZu5QqJD2P5JRNMgDTwl8QHjW+CuL2Ove2yZhUbqhFOMaJHPHOz2OqzXtOeEVHvqtVz1LUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MG9ESs+1; arc=none smtp.client-ip=74.125.225.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MG9ESs+1"
Received: by mail-wr2-f30.google.com with SMTP id ffacd0b85a97d-48439feca17so679284f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790158058; x=1790762858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3HwIHpPDnN84lvdPQSb4nxQoj1g+sKDTa/uOr7Nwwc=;
        b=MG9ESs+1DhZn2l7svedZCGdFQAmHP5vCCACZN+EtC3wXaB/z31UrHOUUjjYzF9HhLt
         FPWrNdUmCNfyIlfOE/s7icwBTtv6bSea8IAbJ8tCb41eDBEHcQH/WRAzEoz7V75dGcCN
         iYzR5Sv3pwdaHdmJKmt9YbwPdnyVj3e3TrBDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158058; x=1790762858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3HwIHpPDnN84lvdPQSb4nxQoj1g+sKDTa/uOr7Nwwc=;
        b=wabIcjGt87fkdrFEwbqU4YAGJfxoW56fvJXUO2aAadiuZI9g1tZtCB0Pj6jzxmpyq4
         orob4wpyTr2SXlbg4mSaqN/uOZON7eCebiOYZ6pgzkb38IdU0iRnmRIJFsisaOH6cwIu
         6at4QkIUvDEWlQlOuG8VQnd4WvOGyqsfqvoUMQkyDLc3mzBKY0afF1nERBOnWV13x1a6
         WPpj7xg3YmCFgfcDISDkmNeI2xrVjv5/SJAGfxRyfJZFNMBPfIOrkYfd1nBMydKT9AIO
         bvFvqkrA0VlvVuKOjVDpJQez/SbmPDTVD2K0HmzrvVTYlyEYAwQ65cQrnKxFyFTANX+Y
         WdxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO8cnpX3FK1loNnS70klsI+++QNKRv6xeDJqnCQ6HKms6C21TuVUyoEmysMcIxqWcl+UHRIUrkxSI=@vger.kernel.org
X-Gm-Message-State: AFuF++k5d5UXzX03uMQpMCyQOWdx1do3Ny16N+VRvX56/sRFvEzOE+R1
	UiZzEdty3gO257aPoUwg1yozSqXyX1JvG1ia7vEMPZwUqHlADbk/A4HC13IQR1u1Sf0=
X-Gm-Gg: AYBFou0ktKBctg3O+DvFGpZGmQSzGrVNCu5rZ6RotJqJrUlCyhBri/vLkww2HHLoOz1
	KXcAAMbCDQ73oIxDGJuFRa1Rl7riTGrFNczrDexkg2CdzCwMoqy6nI+9fXDmVOqzriIB8e7xqlz
	NbmFeSz8/HsrSFN1tvf4eIb4siY8R/XtLzsB2XoQxthIjYwIZx8HE4xVFg5Z8F9pKQesRsmvmR3
	aXdeRCOa0IeszKKMS40jMm0eprVwTdHyc0+23B1O+a26CqFkg5IfAweLRkgOb4KkbsgAU2OU1Xe
	+NIThlSS9g0ehGZS0bzG4NjGfrCR75/IiPaRa1/kcfgYcCpC9TFJXgMmm0RRFbrii0DGFnnrLOE
	fU5eKwBGGkbrNtVMz77RnCH95TgMRKBel2kSV6sZcmz/KxQPzd6yct4ZwllbwR+c+UtH6RMPwaL
	5boongzL1jfQ2Sx6mCPE8sfOP2bKMPk+FG8pggXctMGwdkFqr2CaMn/8HG7UQL2bWpxga2sTUQc
	S8FpA==
X-Received: by 2002:a05:6000:2901:b0:487:a3f:1ea6 with SMTP id ffacd0b85a97d-4886704a159mr3802209f8f.11.1790158058311;
        Wed, 23 Sep 2026 03:07:38 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm6058984f8f.16.2026.09.23.03.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:07:37 -0700 (PDT)
Message-ID: <ed2f9269-0428-4dcf-b6b0-d7b6eb0b140b@linuxfoundation.org>
Date: Wed, 23 Sep 2026 04:07:30 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Reject unterminated strings received from peers
To: markdamirkan@gmail.com, valentina.manea.m@gmail.com, shuah@kernel.org
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260903-sympwn-linux-005-final-v2-v1-1-f92548abf9ce@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260903-sympwn-linux-005-final-v2-v1-1-f92548abf9ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 04:05, Mark Amirkan via B4 Relay wrote:
> From: Mark Amirkan <markdamirkan@gmail.com>
> 
> USB/IP path and busid fields are fixed-size strings and must contain a NUL
> byte. The list and attach clients and usbipd use fields received from a
> peer as C strings without checking them first.
> 
> A reply with an unterminated field makes both clients read past the end of
> the 312-byte device record. ASan reports a stack-buffer overflow at the end
> of the record in both paths. In ten normal attach runs, the busid error
> printed six bytes beyond the received record. The server did not send those
> bytes, and their values changed between processes.
> 
> An import request with no NUL in its 32-byte busid makes usbipd read past
> the request too. ASan reports the access at the end of the request.
> 
> Check the strings after receiving them and reject messages without the
> required NUL byte.

How do you reproduce this problem? Can you elaborate on the setup you
used to reproduce and test the fix?

thanks,
-- Shuah
