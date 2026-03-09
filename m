Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B6436A008
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087967; cv=none; b=kpUHbcIm7wpAq3qVnW7AjAUqDpGUgUktoiZQvK8IzfpSHtZDLAh7cyLb6g8gQzbL4Jc98iGfIZU442TktoCXL/KZbsNjoKkE29cUy7jIt9SQgfWgatGl1wSLYsrmflPqMAu+nH9JqSmuS4Wl+iP7jevMq8WgBFRBjTJuOKytVsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087967; c=relaxed/simple;
	bh=RnPeebRGydyE+/0A5BpxmKqsJLfKjsowTx8rzyAeHJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o688YEgOOZIWa2VfN/2WuFq33HWiw1dLmWh+vKSsunKYjF6qOw/NSDIPxBzL0bT6YO+aTXGxbZOd8sYcAbzyw5ZBCHp31vsJUj975jDYZPCz37XhidXZMq2nZXC/R1AEj8KagbwAkpIEKVg7RucGDJvIZKfuVJlJIm6j/7wWHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y0+vU0aS; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y0+vU0aS"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-41708f6c3feso1347083fac.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773087965; x=1773692765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIVaMagKSk0xMjgzF3P13CDm/3q/Nec/XRagkn/drZs=;
        b=Y0+vU0aSHZ/PjUvNMpZfjJgZV52XhQM8s4UMHudCeYQeua/Tp8rkRa2YhCWxKeNfJC
         k5sw/uIcF2xN3EryunrZNOAdiW85KpRU/no8wyOjTa9+g+VF0KLwqOkMycSVbl5ch8A3
         cQZEEkgjsF4S2y4n3n2ZFIGh5hWJ35Inlgs5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087965; x=1773692765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIVaMagKSk0xMjgzF3P13CDm/3q/Nec/XRagkn/drZs=;
        b=I1xL6L3ujWCUk/VM15EWfAOJDGs/raPstxklzWURLdp5gZ+dXY3xTLRYNTdZa9VPDq
         yqVRBgY6HGdrYzupDDFP9SLNi/lv081Uv0DnNqQ0dkSixMCFwmzvDfveUHPhqnxbzjPj
         h1ecY8lb7X1zMupckfmjT2x3Mam9c+v2HmXeUdn04c9lGR+6cu9C0svc43DfuCfHUp7n
         HY6+e5LM2VxJdt3gbMHS8PYhLhxp3MD8d+l8Tua0+bX7R6DuFfQ5Wub7eMDskYvkxbC+
         U2OFn+cYhpRZQYOc3TjpXs6JmLkS7wsllxNar2A048fih4usdpEDZ7M7WrV7dJFKPMC0
         oE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuveMC3uLXRxT7UfBJIPi5/w/MssHVEbsv/A5tJkH2MLvyxtNKFGGyMiqRvbNc/djmcgMp9fBHOsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2F/DhyVCpr/DFwm3HxGJa/oyH/aWMNyzs+z1FbLof4Xv4Ul6
	ZiB1RwuZ27BLIvu16VuoTjrgXnPkCbgJz84By8DDUf4mNCrmsIkECCSY+Gc9YuiF6nI=
X-Gm-Gg: ATEYQzwdD5UFvgb3poCP2sTcBu6plQXzCpEsnpTdROep+EiSU2QBrQn8BuspHA30dIp
	QXFk+YYaFM8FHZZlUzLFhyOhzbYyM9zdp7tBPfCwgUmzpbk8Zq06eUynGvfluQtKxpSYi9aj5d0
	oybnRwlOYE91HsvkV/WpcrI4+T0zKXaNm7IKu46JufntBP1qtJy8IfhT9JIR9oMIdL1jWUsSJp5
	fdS/HRfZKXmfBc1HhNPFo12r11+2z8FoZkNL38Fr0NRXsahRbqlbpgD8lkTYgDlR4fEFuE+d9b3
	vaJU8FQO624DJ8ALTItjuR+FiYWmi5d/ZZlOJuaJw3A7lNgAmaNTUHamCjQO4bCxrnhXcPMkHzd
	s8S4tGpv2VlHQs2UJ9RkvWsWNCdh9Iuo3ipafU/x9a1UHMDM5OcTefcj5kYIIF3/ipMTTz9y+3Y
	Txb4w9TTYSfIKqpKS//84Ds6LA+4GU6oyElOY=
X-Received: by 2002:a05:6870:c2a2:b0:417:4693:ca0 with SMTP id 586e51a60fabf-41746930dd3mr1444673fac.14.1773087964941;
        Mon, 09 Mar 2026 13:26:04 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756dba30esm536853fac.15.2026.03.09.13.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 13:26:04 -0700 (PDT)
Message-ID: <9d727cd2-701e-4c5b-9646-82874f2d0a4a@linuxfoundation.org>
Date: Mon, 9 Mar 2026 14:26:03 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: usbip: drop redundant device reference
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bastien Nocera <hadess@hadess.net>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260305133851.2952-1-johan@kernel.org>
 <20260305133851.2952-3-johan@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260305133851.2952-3-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/26 06:38, Johan Hovold wrote:
> Driver core holds a reference to the USB device while it is bound to a
> driver and there is no need to take additional references unless the
> structure is needed after disconnect.
> 

In this case it is necessary for stub driver to hang on to the reference
to maintain exported device status.

thanks,
-- Shuah
