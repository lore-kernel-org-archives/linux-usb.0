Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB2466B4B
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034705; cv=none; b=gXuOZRaq770FRpFeFs2VNF23ig2i66d28JzbyVP/emkKef3EtOkrQBewvd6eLOLZbilVLjAhIriBWnc/07H65PY+HJV8NAlOmzZNKn+w3vgxvKafHHlidBHbhINmdua+vF3pwiR8B9jTOUkljWXptL2D+PxEbbdE3cvuO4z+0Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034705; c=relaxed/simple;
	bh=t5jlailmoSg0o95YvconMa0D6LkFqXkCDbwK0SA6mRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkb6hjGgAQ1eGKwfSx/YP/vGmMUQmz/JgRqic76LjnZgHG1OAY8nupfrTKFU+D7G92HkyNQoVws1xAmHeTAls2LF9LS1exS13EXHGo7rslBOjm+OWJb2/upAJGaHD+3mQMAW3gegVem5bvF/np/QC3AsdC/hgkeEdGRK7moC6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7jdTcr7; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7jdTcr7"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca7c1176317so3094637a12.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034704; x=1784639504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IDhD7lLpbvIs++Q2m/ckYg/Y1HMP201u/uWbOCEuBE=;
        b=K7jdTcr79vg+dnuVNNxDpq5IJPsqYQxelEooQm+J+IFjokVULPoPq2xrm8KzXKSXy6
         7B8W69c3oC3V1lj6aZdprnLtOH13kZ/F9tOqaPxY4ludtgaEkGUH38pZBM5CsXRdl7oD
         8i5Ae4dvXbrDXYWBOysvy3Z+/XAbM6/DQPg0pF/vY849VAnd3B1IirKjJDrk8Rp/tEoa
         R4D+U0sh7rkmPPUlLQye+fIP0kaw79XBR2Og9fs/0FNZ4q4Oj1UJgqY7NUafHJzyE0Bx
         3XFDJCp/GQmG3d9+igUz+4AhBOKZrMqT2/Jln/NA26+Zkthafj1TBp+ytBXBD2hOzzLp
         Wdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034704; x=1784639504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IDhD7lLpbvIs++Q2m/ckYg/Y1HMP201u/uWbOCEuBE=;
        b=JUo67dzx2DCei3FMxpYCrmVgjT24S2hFM0VlkKF+GSE4F8tZxq+TagssOfKXhz68cF
         ZOyytU41zdU4Ed5VApyk2XMDKafwdQTg/Gfh/i2OeD3BnEPnVgYcPou1o5ROHC3Wbh90
         130/KvC2jpKCfSVUcOddDgQMtVzplAGxxRSBT8VUvgAdsb2+T7vmri61r0GjzrLycXNr
         cekb2g1vWA9E30qPLpY6kEiU65CqH9J9eXYQa1RiloWWq3PrbBaXErXIWgZWZ+IiLlAx
         x/ncbQLEfyXhsPr63IEgT4/Gpuoa8NRYHe83b9iXvqvhq8QhfFdxL792i16Rct4xjck8
         HRgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4lB02FeNlQu1hoOHS0ZLtEzU2k0YxMFWwJnAENpHPfaZVsb+9nYhzCIMpqa0lz/wFv++V2QfglqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7muE754Kz/t26jilj/BXWt/TpL4+M4p3s4Q4IICtJXgTEaFXR
	fviErFvPICpJUyljdMCfy6NuXo0+b7XT/NFV8QQ2G9xB33h7D7me3iWbQ9/unRERtro=
X-Gm-Gg: AfdE7ck3ejNdKa4lakDyd78pdA6u+Lk/9Vz95UFZxcJfx06ULR7z7T8Lu3uyjGWIuBi
	oxeSgRawHNZsdQw/CbLMXMa3Avqw6BTaYwmQGkpdzjaSJZPfA8i6z16lI9DtpkffED7IfuRI07B
	/zahd+2q6VgdjN9yBbpJOd9tg0QQ9jW7ZuhkXcTFPE3d88XencWwLmIV4v5IaJhRPVAEnMfhuJn
	Y2Rl9sWVA2VwpUlffAsj52U9xSjQS36QEjhAxEA+6slgZKE06WmnmZuXN7rLcV11tF2kkylwpwE
	ymnKwNlvFTTSpGx0SsRB64AhqAF4RgWKYtEBYvuorqumlOzMbKCGn5jRjHvpwlvr+lf8vZfgcoi
	FONG/gZq4OtgoEZWpVWgLKdy/MxQGBP8TjZNVukXfVmZ5yII+1lAyh1wYeMP8yZc5ErGw+vgi/x
	qxcXFiQ5buSFcd4oF7qEDN
X-Received: by 2002:a05:6a21:b98:b0:3c1:c6e:9360 with SMTP id adf61e73a8af0-3c1104e16b2mr15388171637.32.1784034703752;
        Tue, 14 Jul 2026 06:11:43 -0700 (PDT)
Received: from [192.168.55.196] ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cabc7b2aa4bsm4057645a12.10.2026.07.14.06.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:11:43 -0700 (PDT)
Message-ID: <6ff946e1-5aaf-4212-84e7-295deb91372f@gmail.com>
Date: Tue, 14 Jul 2026 22:11:41 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] USB: serial: io_edgeport: cap received transmit
 credits
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260714104230.893968-1-shpark061104@gmail.com>
 <2026071451-perennial-salad-1068@gregkh>
Content-Language: en-US
From: Sunho Park <shpark061104@gmail.com>
In-Reply-To: <2026071451-perennial-salad-1068@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/26 21:19, Greg Kroah-Hartman wrote:
> Please slow down and don't send patches right after each other.  There
> might have been other review comments...

I apologize for sending patches too quickly. I'm fairly new to the
process, and I'll allow enough time for review in future contributions.

Thanks,
Sunho
