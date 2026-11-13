Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606107;
	b=sGaElCLWxsJ8soOoMvLpNB+AKnUpRwOY5I/VVjfwXFn19VkmtZ2xkdPyYwuSlh0+sirL
	 C/2Xo2jVdlzIt9Edb2vD8oysX8uKrcXA5622M+MRAFcs4f2bQHzgh1g4I3Is/okYFHW7k
	 KCDAm6FsAo/3uYKl0K81QPZbE1M1AavLJi8bWpeJS1UlmEWFqGpYLKUVv8PyUPvM2c/Ct
	 cu76EJUL8wVte2UoB2+AXcxrsN8zrSslaIZxosC0HjBlOvCT1FIaTNZ4BQVfBeWAQ9zDw
	 +99GTciQmLQL79AwvNz3Vz6qJj/Ojlf44FhAzy+GbQSgT/FmyR/dotjZ1pkl7TOyZoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xhQIHZA6VTVgBZmCBhoLcYFIgrIijG6i5CWFzX2HxMY=;
	b=tkwVAY9YL5xZGQFH2JRbdqOI/eQv6rlYEZ7hKASIb7b9Fk60b+sOeT/TYXte8uSleA7d
	 VR5j+sx41dXRjhCCB5/ShgogVkM39wJg3CA8yXYPK0PEtQVhLzTf6uPHQjEFdZ0PjzXlV
	 7aZZGXtpynvvYKmPrYm0PxKE5GvmXFxr0BQnw1owRqTHKCUb73w2A81S1GFOKQSMxvTBd
	 8Xxf4qQz6tdsc7oYIZfrBDuhupwj2UXQIcJ1HCeqijw54TaOmVK+BLdOWSEvgO5dSJbmG
	 LUxTWpLliBBAbT3pWv1Ugaq1bgk9MOw2yFMli/Duoa9WYEUfi5nOZ4vt+EdzF0bZC0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=FOUZSFM5;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790D606A33D
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C790D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=FOUZSFM5
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a451915d8aso2019200b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 13:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794606105; x=1795210905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhQIHZA6VTVgBZmCBhoLcYFIgrIijG6i5CWFzX2HxMY=;
        b=FOUZSFM5S5d1miA7Lxx0Lf6OhSwlwNfuHZ5Jqx01yrOE9LvH+Q8m8252JavLipl0XJ
         uTYk6TJLoTtCBo/+0JEVJWlsti+MY7MO5wFKSWClF2sxYLyaHMZ7P0K40cQ0l1G6QM1R
         SgcPi/Z+Sty77r1hVG6EXHzJoQll7d47WKbik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606105; x=1795210905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhQIHZA6VTVgBZmCBhoLcYFIgrIijG6i5CWFzX2HxMY=;
        b=w0FQ8jmbpIhYoMN/5dcq3kKxkZtupmi/c3gwashiTfyNBudUQOhF2tj6B+gEkLuaXe
         fmeMOgNOLJ/2uV8LA/NDkkzvUIBo+g0lQS1+37DLelWpJI4YV3Cx0sF2milhJR/Ca2cf
         ezGToJFQcozNxtcncmm5fAPBNTcjiMEaueTBxrZBMIe7ysuy5ph/GSmjAwhpHsWX+bPV
         yWqC9nNEaufMz/fF7jPaiN5VSjZGZw/SD18gu701rfZvJnqhAvkZLpslPGYgIdN9w6N+
         qg8F1nNUojaNSM1ZCSQYQCUAdPdMSQXtHLxPi0DIafNi48Qi+GFj9t8DLhYKZ5r923hT
         EsYw==
X-Forwarded-Encrypted: i=1; AL+hErEhnRc6zoIEOQYEgKoV7C+lTq4tGNkBqqIxcTHPdlzSW4zdrV6GlNwUdEBTcCASjjyTKH9WaIbpdJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z9qcYmAIix9gHyacBZxsl85iJDDA1UdaMUe2vvVpq1Mc+NmJr
	8mIFB2RTCWzVtGywEGjyphVuhZYQshkc680yDcHOLwTU0cQut3/G25fSUip7kxVIEFc=
X-Gm-Gg: AYBFou1TPHmNHV6fzrW67lyIZOEkuSHBb2mxPBRKyhdAPnrlXjtrgQdIQ0m8cMzcZY9
	yN7K1nU/16Pu54baxfK5B1HeEQUcW0p9At4S0BuAQbYrrkJbWdV2g9vRqMl67F074ZTn9tGAsyc
	DXCADCoGL7OVad+v1yS+Y4RtNGDb7LAX/YPX1RtClm5N2Xt0IXZrfFpKB+jk9txhK5YHfnIbaQ9
	rl2qRvXkulVTKEOU9ADAzMcRD6hwH63tEZmA6l3+QwAq1nEyA43DaV9DH2cE/pRgu7tED7bufI+
	7cSjzsEhlUJqyab+KIjeCXCeMDCpdVA4EwnLOBtsq+kZYHuMoTfCr00S1U/9NFEXnFvinTK8m1H
	58M4IYS0MtcQelO+TmqDK9us4pXkMc9yPfxU7DQvdYcUvfl8tQS/pozGBu4ik8TRM6Z/XBNVk7s
	28JnXP/wsSK9ofFFJM1zm5iQPXcZ15bjxcJYmZqZlNNjlgHAoG3iI9Jrkb10nkPP+PWEavfUX+B
	yP5yuILEeO5DQSnb37kT8z+OJX3RMH9dk17OywomFR2cnsuYA/RHRgoeGtaHJ/z2wnyLaFfpDGi
	4wKhdYBvjp8ZceKZF2XFxj4j06pCF2hA222gKMQ=
X-Received: by 2002:a05:6808:3010:b0:568:1e54:3d74 with SMTP id 5614622812f47-56e64df14ffmr3388527b6e.39.1794606105620;
        Fri, 13 Nov 2026 13:41:45 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm3131199b6e.12.2026.11.13.13.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:41:44 -0800 (PST)
Message-ID: <573f682d-47ee-4e39-80ed-0ddf0da96cdb@linuxfoundation.org>
Date: Fri, 13 Nov 2026 14:41:43 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Close all listening sockets in request workers
To: raoxu <raoxu@uniontech.com>
Cc: brgl@kernel.org, gregkh@linuxfoundation.org, i@zenithal.me,
 ihadzic@research.bell-labs.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, luiz.von.dentz@intel.com, pengpeng@iscas.ac.cn,
 pmenzel@molgen.mpg.de, shuah@kernel.org, stable@vger.kernel.org,
 valentina.manea.m@gmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <67b2c06e-0caa-4ba1-89ee-17cb814d173c@linuxfoundation.org>
 <351AC939AD9B6359+20261113023710.1746483-1-raoxu@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <351AC939AD9B6359+20261113023710.1746483-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 19:37, raoxu wrote:
> Hi Shuah,
> 
> Thanks for the review.
> 
> I found this while reviewing the listening socket handling across fork() in
> usbipd.c, and then reproduced the issue with the unmodified usbipd binary on
> two UOS test machines.
> 
> Both machines have usbip 2.0+6.5.10-2 installed, with usbipd located at
> /usr/sbin/usbipd. This package contains the original listener handling.
> 
> I used separate test ports to avoid interfering with the default USB/IP
> service.
> 
> On 10.20.12.188, the reproduction steps were:
> 
> 1. Start usbipd as root with both IPv4 and IPv6 listeners:
> 
>         sudo /usr/sbin/usbipd -d -4 -6 -t 43241
> 
> 2. From a client machine, establish an IPv4 TCP connection and keep it open
>     without sending a USB/IP request:
> 
>         python3 -c 'import socket,time; s=socket.create_connection(("10.20.12.188",43241)); time.sleep(300)'
> 
> 3. Terminate only the main usbipd process with SIGTERM, leaving the worker
>     running.

You removed all the context from the thread :(

In the following path in process_request(), child exits after
handling the pdu - all open fds get closed.

        childpid = fork();
         if (childpid == 0) {
                 close(listenfd);
                 recv_pdu(connfd);
                 exit(0);
         }

How does the problem you are describing happen in the normal
use-case when a child exits after handling the request. If
it doesn't there is no need for this change you are proposing.

thanks,
-- Shuah
