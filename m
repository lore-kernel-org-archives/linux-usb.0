Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523499;
	b=0jFgBNvVGO4r7A4FhQlw1sz9CcGLtI/HGGf/ho5zBgouFKktDJe8kCS0vnAEcNWMt78T
	 3jbCbR+lK0U2Qoh19KLl68ZH6WQmX+w6bGo91mpIzKHeJ6dgj4SZdy6hwVdgie1P/jdSj
	 cb561q6u/KEKSObOmuybRgXgHfjLRPykDd2CCXjTyYjVQwCRoJVi5qgScNhiVX/abWGOs
	 J/q65s3h9m2tyTwGaKwgFGIyLsmXNMSPwuY8JYCbUEGDYqZFzzRAQkNo/VM7E4gCmO13u
	 z1+BeqSxobrTYe615ophOvjrQj0wTsWR5vTtiE2ziyPA3GR0wLnYgfk24gSuN/r2mMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=afihCwaweNiVKsVg+YutBoDQwrNLI3A1qT+IzWvjoio=;
	b=KwpxbU4HsmgOY0UmQfdrdj2IeFzzwZY4ayoFef7sLQG53nJ0OOG/u4yaDkOq1gameSIq
	 Iu9hmALsFX2JvqISGakJq59Zkfrqy7xpbtWVQoeH+wk9AMnc6Fds/Er3EftCIWkxTVC9E
	 XP29VBbeOiTe+TODo3CzemfV6t+5NUQmr8xtb7pa9EdGBrBtHItSr86PQp5NTD8smXOry
	 3BxPNBFClKd9nwBdZaNXNyQRkw0e8j5LzV2gB5czMXKppClxRhPCwjmt+xxdkCU0dGae6
	 mkBKeudywhJF8J4T+ThbW26/WgzpugC+ZZdjBCYAg/YkPYavMr6GzVp/yXCQaoa9JqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AcAVkfOj;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F047C606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F047C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AcAVkfOj
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-705cb6ceebaso352022eaf.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794523498; x=1795128298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afihCwaweNiVKsVg+YutBoDQwrNLI3A1qT+IzWvjoio=;
        b=AcAVkfOjkQSdoVtH+9OLXEJQBQp2t8ZbFDq89fPWB7IeggvCLJhUXFGrNObr5HlHWP
         0TfsWFM2M0g6s5piLPlsky4HgDj9QghV9jsfi7aN/cDrW9IlSnOez5WiF8WkB2WpFYpr
         QZQcJ3luqmITNdWnBY1qRGF7JYw3RAgeQiokY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523498; x=1795128298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afihCwaweNiVKsVg+YutBoDQwrNLI3A1qT+IzWvjoio=;
        b=jWmRDBo15Xl2ExhGuCBgFUidnQOf998GEF839honxxBE1xDokjaczDtyiSTNOdKTAG
         cyJ6OVXZ5V/N/C2oiyMcPl1G3lDj9avTde4Van4o+q8BLIVzVprqdVnIuwhUfSuL2kFL
         D4j4wsTNw/5UTIkOnZdgJyXfLiGtjAVOEPMFu+/l3Tvah+a6PO5G7dR5wSxm7Z+2CUvX
         t/1vCVv8BrlWlTRyJg1XF6SxEZDAQUkz6lPcNZHG2QdZCHVGJZCcYKsdb7CTW4utWaCd
         cxTrN/qoP4PuEtMS1ndV80J4aqIYV1fjtlmYPsE/sA5GJmnjGj8FU1mumc6BKcgFmtDH
         pptQ==
X-Forwarded-Encrypted: i=1; AL+hErEsEVOp164o8AM9p6jKJkY6GSY0ZH/0tYPzrx7qgwTfbc2yJyTSJBH43riSBQ/nQB03xxTU1BWn6tM=@vger.kernel.org
X-Gm-Message-State: APuU4Z97MoTVhV+HFktvztDgb/AeR9ugvVRh68KfL4geyZmTviRKKzw/
	F+IizOGXanAIUE/PvNkmz0JxhiGcW8xjwNXRb17rUoty6p+1KeJA9HEKb/U2hAXi5EQ=
X-Gm-Gg: AYBFou2+AoPhMsEwFnrS/cqaW4uWQZ+C+5HC7gWaL7G4gjsGpe/bPeI50Jp1r2AiMv1
	YE1ytKcT+8XJaZpsEvzmPr1UeZ5bdBwSuRot2sRWaFTTrFLULvZI7dZ62unDe9xpb5OVasESpLH
	hZNL2iPT1xMIvsTepiiIsIs2j+bMWTmSes1bMF+LyImSUtz+RvHzKpQ1+m+2oV0bYmhpmNIsSOU
	CmDBFCcT+NEfmlDnqc6HxD/RQjtW4x7IrIAOl46dfUcS7KYClomFwIFwLt32+Mpg1M3I7BFQldR
	j33wa887XPLUxakTQGHjAzcIUWubIOzBmJ9Fd68DBOHGhyToQZbmOTQR5TFltaJS5lGIbNS1hTt
	PJmvrhwXV7kewfewgmzz2kk/+3RyTvHYJVnLUXyZ7WqE9MkuJUav8nQnMH60+9hdGmTTT3vJZHq
	hLWcgdj9FLfZT4whXytYlbz6mU9MzXB9bN4mw9MC1gwLijHbVbRjvbUVZ6ym49NKclOADYNf/1k
	YJjYUcgoCdStxejRlqYMk81fnPa8++aWrbdSMSNeIC3BTBeecN4FPzAqfi347V0a9urElop+7Al
	icu6J+DchCtGMi+PJSN2Gq1xm2fFvDu1CKIEInw=
X-Received: by 2002:a05:6820:2218:b0:70a:df8e:8f64 with SMTP id 006d021491bc7-71ab4f0c26fmr517770eaf.22.1794523497862;
        Thu, 12 Nov 2026 14:44:57 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm479599eaf.6.2026.11.12.14.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:44:56 -0800 (PST)
Message-ID: <f849dfc1-c7ab-4285-b668-b37eb15e37b4@linuxfoundation.org>
Date: Thu, 12 Nov 2026 15:44:54 -0700
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
Subject: Re: [PATCH] usbip: tools: add --sockfd option to usbip attach
To: Raul E Rangel <rrangel@chromium.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Hongren Zheng <i@zenithal.me>, Shuah Khan <skhan@linuxfoundation.org>
References: <20261021214808.58609-1-rrangel@chromium.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261021214808.58609-1-rrangel@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 15:48, Raul E Rangel wrote:
> 'usbip attach' always opens its own TCP connection to --remote. A client
> that reaches the USB/IP server some other way, for example over a UNIX
> domain socket or a channel forwarded by a multiplexed SSH connection,
> therefore has to expose a listening TCP port on the local host just so
> usbip can connect back to it. Any local user can connect to that port
> while it is open.
> 
> Add a '--sockfd <fd>' option (short option '-s') that attaches the
> device over an inherited, already-connected stream socket instead.
> '--sockfd' and '--remote' are mutually exclusive. Because sudo closes
> file descriptors >= 3 by default but preserves stdin, the typical
> invocation passes the socket as stdin:
> 
>    sudo usbip attach --sockfd 0 --busid <busid>
> 
> The descriptor must be a connected SOCK_STREAM socket: fstat() must
> report S_ISSOCK, getsockopt(SO_TYPE) must return SOCK_STREAM and
> getpeername() must succeed. Both AF_UNIX and AF_INET/AF_INET6 sockets
> are accepted, since vhci_hcd only requires a SOCK_STREAM socket. For
> AF_INET/AF_INET6 sockets, TCP_NODELAY and SO_KEEPALIVE are set as
> usbip_net_tcp_connect() does.
> 
> The connection recorded in /var/run/vhci_hcd/port<N> for 'usbip port'
> uses the numeric peer address and port for AF_INET/AF_INET6 sockets.
> UNIX sockets have no port, so 'unix' and '-' are recorded instead; this
> keeps read_record() working and 'usbip port' shows
> 'usbip://unix:-/<busid>'.
> 
> Update doc/usbip.8 and the usage text accordingly.

Does this patch fix a problem or does this add an enhancement?
What doesn't work without this patch?

thanks,
-- Shuah
