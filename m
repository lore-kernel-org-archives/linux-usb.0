Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337059;
	b=rJpfAMVJgSSiKwhLsCxbovto5BLx6tpsnqEudxoAOfmfOnWdKbYs2R1xqHPRHksWNgez
	 XHoXZSwEqxeVOZsgtSWwU6nEEHRzeCj4MYaOee9/VcqJCqs/5FeJDFfSKa6ccmRTxVqon
	 xWuaDWziu9ALGZBKmROYy6h2RofLcw+6xj8WX539q/YzQO0wi5AK5gzwAS6k7U8X01Jf1
	 XnCP4DcYZfDVYjgstr6UbMY/Aoq1SfAHfwoshdyAxXmdYX37jQ4qSVp6222aZGYXsMtur
	 1pqJq+bRWfzxX9PDqZV22jzZXPD9kRNjlONADgoNbaLhi5V//iwL4xKixQJyMFxtHmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F44G6NiajqxZ7LY4zOFREBPuA+6F4QP2b192ElDEILA=;
	b=hP9yCBSiUwjvfRXdQCDki9Kl93iCR6Bl9JobF3vkGPTmJYttvvNKFTTz5LjNWNvx/21N
	 HsAWgfDK1OdOh0AH0E5WU4iMujIo2EbZiShuqN4eLW7otugS5vKgzerepTmsh6hFci8RE
	 bqvUNtxLdkykK9Q9LpPUIpUUlmu4/z1wQEQYDASA9L4kta40XWojgjQT9HFKBb2xeXyNT
	 epAtVrhC5NX/xVFwSiwaB3gKJiPDN1xUorGeusDqSjK2o0gcjvtC3KNINib4B/HOiyUG6
	 3PbT5KCVntzuGcMMkKpkFTaK5h888gJiRlqNjv+uIWu1Bo8JQJdQej2NFqvVf6lJlbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=YVk3b5RT;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66D606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 18:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B66D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=YVk3b5RT
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-846566246e8so2167956a34.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794337057; x=1794941857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F44G6NiajqxZ7LY4zOFREBPuA+6F4QP2b192ElDEILA=;
        b=YVk3b5RTrTjvOyVHq/Highf71bYeoZjE3b/4aw8G9MmwPDKXRLtA6xIWRMw8j0dJjn
         z87uU+DQtclSaQKiwkD1fdXbK0gy5Xvlz6CV+oY3mwGJfBaTpswlDq88G8RPdJ8di6sD
         Bobzl/LauCJ69mH5+WUC/N9ynTY1BX2SqMZKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337057; x=1794941857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F44G6NiajqxZ7LY4zOFREBPuA+6F4QP2b192ElDEILA=;
        b=zcWzyhvJL2mXyBiaieTKqALky3uvMYZRkza92G2Tw6OQy902qFdoK87rZJbLmH3BRn
         IE9Vbqe+tcgg0WxIcDDLJc0eyci9BbtTmCaF0wQKaPdUF1k5YZ+KtGeYQDTpGaDbfEbZ
         LP774X4I+bWCVqLs3t1LPrzVZttmkBwoLEtz10/jgqlVN9MoYj35fsGaDSdh4JR9ka0G
         Z6ulCIf0DNP2zxQwNunJ6ceJ/YAdbZg1euljF3vIPqc6PLgnVlT/PQCguaKkVS8NRjIF
         z0yuZ1V0WYjSgBmVmDX0OlyJ3NAOQ7A8qr1b/hYzPdeEG+UyrDeexgaGQZfHoskWVw3Q
         rWvQ==
X-Forwarded-Encrypted: i=1; AL+hErES5l0mbfM7vlUaAoz0dIwCki7SBwUEC4L7CZKelfR9q8Rbu0M/XP0tSmFc8/qX4hvnpR12uWRLEkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z88nn/f0cax3oQ4C0Inkf9USGj7tobQag14tOJx42MvjOl8GUMU
	wF7sKp6Cy+UcGzFHjYVPLxIk4aoBDlMqCBM/lu8E1RZb7Uq24BhoAl8y2P3rhuBNptHY1AilmO7
	z8U3NdHo=
X-Gm-Gg: AYBFou1feCLnldhO9JAagf3/RoPzRzw/J93c5tZXqAKjiPnmT11clAb6c4hOofI0LIg
	KD15FfnbI36EZZExUaGaRH/zEwRzj2+VHopBVuWi4cQXbl8ZjvQNVNfV+srWa54HT12/m3FYxMs
	wmH4y0ynNa5QiO5+ct/KN1oPJoLN6i/LOo2+N3pf/TIgcaUYBmDtATyrAAn2BBvSs7d+eaFbFi1
	tOsv1SxzaKBdcgE81ZpX0/6tQp74q/KyaBy8luZgwUwWpfOhIwxiOoDKSYez92GY4gXoBAsVw+p
	TWPAn/QqSHs1CozbGeWAQHzzNN/fE7Ct1tBF1b8SW/4kbZzhRmNr7r8Z+nvOQc+qh9DQCC1oCQu
	1aVOqdLiB/f2w40o1T5oANezAqM042l6bJX5x8I/eQKSH3UeDzpqzpCJaegWXhUuZMcYSsS8d8Z
	lwTdrAd1sDG94uHzfOuy0r70eOW2ZWDJXLxz7gNASlOErYSQ9Xp/xFRrLqP/c26DM6Ywy5k/jsA
	XIrqck9JQGSAMVpP8NysZoPQALSti9srByuows2u/fILgZ4rFEc3gjXyABGg0Cmo891TG5Fh90s
	yTlMYw2u+eKer32nlN5LFs0JqVtJYJ2v477O43Q=
X-Received: by 2002:a05:6830:34a2:b0:844:ff9e:d9ef with SMTP id 46e09a7af769-860f02d26e9mr227646a34.11.1794337057282;
        Tue, 10 Nov 2026 10:57:37 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dca41c80sm2565169a34.3.2026.11.10.10.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:57:36 -0800 (PST)
Message-ID: <3648026e-e93b-4543-87db-e56020770831@linuxfoundation.org>
Date: Tue, 10 Nov 2026 11:57:34 -0700
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
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
 <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
 <179333358668.2111112.12827497703998022783@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <179333358668.2111112.12827497703998022783@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 22:13, Cheng Yongkang wrote:
> Hi Shuah,
> 
> Without this change the URB is still completed to usbfs, with status
> -EPROTO but with the peer-supplied actual_length intact:
> >    vhci_recv_ret_submit()
>      usbip_pack_pdu() -> usbip_pack_ret_submit():
>          urb->actual_length = rpdu->actual_length;   (usbip_common.c:471)
>      usbip_recv_xbuff():
>          size = urb->actual_length;                  (usbip_common.c:849)
>          if (size > urb->transfer_buffer_length)     (usbip_common.c:856)
>                  goto error;  /* rejects the packet, returns < 0 */
>      urb->status = -EPROTO; goto error;
>    error:
>      usb_hcd_giveback_urb(hcd, urb, urb->status);    (vhci_rx.c:107)
>        -> urb->complete(urb)                         (hcd.c:1657)
>        -> usbfs async_completed()                    (devio.c:1911)
> 
> usbfs copies data on reap whenever actual_length is non-zero, and does
> not look at the URB status:

It sounds like fixing usbfs to check the URB status before copying
sounds like the right fix.

Changing vhci to zero out a filed in an URB that it received, itsn't
something we want to do. Why not fix this in usbfs and that would work
for other invalid lengths?

thanks,
-- Shuah


