Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3FE3FB7C1
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228336; cv=none; b=XiSa3eOpGub1BVC3c23j8T/TdhxNx2ifyYD5kX6yySJpacp/qKDeURnUItQEhDgwc/SzuiHL4KRm6BmXjTiBDE45EkEoPq512m5uicC+YxTD7xPEvJA4KqESzd9i3bkDn6KkzSou62YTD9iLgbcNAX7WCvoGfO1cuMTwFbSR+KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228336; c=relaxed/simple;
	bh=mKjOhGHIu5QVqTuoJTNOpMm+kHK2ePrpxTv81GY5Iw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIFp/fr/Ksod94F3UQiIYcMM1dS8mKjN2W0iYW1rHGHOlZdRY1iDs+kPlfAO1/Jsyff6bpDNYF+3EIPCq6Dp6teneFx6ScuaBE6JVPUsb91k+ra5k2CVv2va4z8Jg6nWylso7gnXW+mdzauMM9jjRB0gcAajrRpkJoIvtDt4m7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZvPXCxIY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZvPXCxIY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495635a85d2so29514915e9.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785228333; x=1785833133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La7ihXAm/B8CtEnL8jb0Nm5CM5Vc5BItIOnx27KK9iU=;
        b=ZvPXCxIYh5qqH41ZhkTmx0cIsPOuOZASKbGY1kyUBJqa6p1BINHAzUkBr1S7ZRo05E
         w04RKGXcs7sDzB3h5LPdyzF5X+3GZNneMLzM/zJyGETs8cRFaWwiaOztsBuqqLWKfI88
         D3xXJyqA9FY0YC15iAReDT35SSbanGUUSEXwTouibPAV2ZdAzIiUR/vrAcE35B/dH5fu
         UjDk/DR2SDhj/ZlHZT7H/HLBlyD+4yCvGmcQSNJxmkAnQPNPaClMGIoiuAmKVG/tTqBy
         9bIRTpS+PfP/dV1RGq6vHxGg24VLHNQBY2aImTrPC7T1Va4x2h3pS2qBPkF72wIZwE0q
         px5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228333; x=1785833133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=La7ihXAm/B8CtEnL8jb0Nm5CM5Vc5BItIOnx27KK9iU=;
        b=O5/d8oAp7AixFoMnzUPPtFaxkivZhjSQaDqu0C4IC8Nn+9UTZmDMqcRQLIC7U7Z7Uj
         IcgwxldrIge3x1eDhG119BlfjzwRHe7lmhNqP1owpRBTtuNPO0yy3fPQJReEI9/6tCXm
         anwtNvz52WryCSt8TwHBdLv1+j7nXSQYLyh5KteJbeBHj12qZvLfhtSG4b9KzGGDvsh2
         jHIzCiOcljS33c540LWgyNi0IxpP+yXYI6uqLZLzDxO9y7zkbonfysyTiahr8Z/tnWNg
         IKpexmnhxvCcvMaIe4Nd7tH/vDtHSogRqwRZ7GO9TpYL5qzZHUBzvGnwzWXcsC7YNPxS
         MbBA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5MQVeheIVR1joKPoqO6Hg1CGdqrSW3W08+iUJ8w5h5hUJn8i/1581cGqEfgQbCVdhmGJ5RWZ94TU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6MuKY5Q79IYteeuQAUNTZEDAZz6hZ6kgYLJ+SnPVxK5LLx6Os
	2f0eyBZHGeYGw/iTC8E3qHbJaCTjSiVRduJaE9kchpPNlrpD72FXXpmD1tnjzpj13fc=
X-Gm-Gg: AR+sD10xoSS3MDWLOXA6u396gr/fZvpsQkxDGWKyN4ZmIQGJNdPPxZx4JYDU+qheL7K
	jI03PsxUNPmRQXCYZVYD0o4TRYECsylBfC7lvJh0NE4pSP8E2FM+gCOEub++eh2dQ/fDhURfQSt
	IS45TvPzZlWJciCVsaRusfLG8waJPq1upx/X753PISD7s++Ht5sGBKFpqup5M/wq48i93OAyEPu
	GYuaPoIc8ll7FJQkIpyUp3NodyT6axsFob2OtHIU0w4MlqNjw7KxFCe6VlePA/mQz/Fc5LQ4Val
	fOTqHUMh7Z1ALdVfY0+cHuwAlKoLuOkbqoK2iZo9Lb/8r56EnN3aTaXtNCe4/XtCXqN9ipaPNI/
	j9UnopL969E+pQGnuGk2S19UBNFaWcOgluDkPxxA4vHDOkgSFzMS3wtkwPNfL/p1ntiefZvQfEs
	aonDXtK6SN+VWsazh8ORrQZZT00sBpqnb7yuySiLyt61CAaEqoxOlG/bGPHSghBWtw77QdL7FaT
	oQGvoXjRuSpZoNxFtYFPaKqVysrkGrM6ETH62+tYHei
X-Received: by 2002:a05:600c:5296:b0:493:c2cc:aecb with SMTP id 5b1f17b1804b1-496c6599c19mr14268845e9.38.1785228333474;
        Tue, 28 Jul 2026 01:45:33 -0700 (PDT)
Received: from ?IPV6:2001:a61:1354:e101:64dd:7ce0:38f6:81c1? ([2001:a61:1354:e101:64dd:7ce0:38f6:81c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44afaecsm69320955e9.2.2026.07.28.01.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:45:33 -0700 (PDT)
Message-ID: <36a9fcca-675d-4051-9f8f-7efbcc273aff@suse.com>
Date: Tue, 28 Jul 2026 10:45:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: image: microtek: stop SG processing after transfer
 errors
To: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>,
 Oliver Neukum <oliver@neukum.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260723195654.152104-1-diegomancera.dev@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260723195654.152104-1-diegomancera.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23.07.26 21:56, Diego Fernando Mancera Gomez wrote:
> When an SG URB completes with an error, mts_do_sg() calls
> mts_transfer_cleanup(), which completes the SCSI command through
> scsi_done(). However, the callback continues advancing the scatterlist
> and may submit another URB for a command that has already been
> completed.
> 
> Return immediately after the cleanup so that no further processing is
> performed on the completed command.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Acked-by: Oliver Neukum <oneukum@suse.com>
