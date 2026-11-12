Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499927;
	b=WIC7bp2G4boJfmkHjf2jWOfvo53m21vC2471l3HTfLoo26EYiWDplp2j7fMEnw3sPKS0
	 Q+boBpCArE6GCST3qdRgFEwkuhGasZ3I9RcXh5EONHJz/ilqMejZOZcYN6qYZJz1myRAy
	 zkZos0jG0gew2HQjL/ZL6HhhvEvfU5dWAgdYWwkNRB/1xafNM2BE+8f0II15J7ua24PNN
	 ePdRedgqxjL/YCdfj8St6jBkxJfvqdBm5MztArmkuUxIxDp18nYY8MQjvzIZnAPmHtNNd
	 efiRg6QKhGRBumaWXozh1x4hkBYJLWha6rjty5OVpwucQ6OCkt5/pFxmvO5zrxxA0Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z5H3JZnDHei4Ba87P8qtf4+QG1tTAZiOmC3aN62AyUA=;
	b=aEtFbe0O0LxKWLlfpLq0RV7cTk/KdvprBFBNhIskEjduLU30v2sImT+lKwOngBXVlPZx
	 FuYr87/OYEq6ZF+dXV4578XGLpeOMSOhd40SwBEIcSBCeDuAauqtm5KFvyyjyZ77WE2dW
	 jcRc4Pv8l5wU/wzzDeA5cXs2a/GRcCMrFzHsy/PfgJslZFIrcj8cBajBMbMYB4Puxm+qQ
	 3LEfxtz1sFGbBZQTJrl1wkMbk6axeE0LHLgkChwfu+6rvFmLArtMT0QTGUvWtPeT/dhAb
	 QvEnxG5HQ/hv70A+HwisSuvjl6MGMCvvtase5IgAS86vj/jLaARrqd01f6eaHdj9CPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=hcLBh0np;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25609606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25609606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=hcLBh0np
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70b875f6f13so3763091eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794499926; x=1795104726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5H3JZnDHei4Ba87P8qtf4+QG1tTAZiOmC3aN62AyUA=;
        b=hcLBh0npSAywjr1PPuz57wOFXYve8m2WOyXnzZUgbNEb7c9QtrzqFPE4/Ji9/kuS9m
         T35iYn9QrePsyCHJni4apXz0my9u0PxqvY3xczQeqTT67q7rHT9/QSDSwMUdDjE74HDs
         0wbvtRY25iiLFwuM4FQPjau3Iquv+Tce5tUrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499926; x=1795104726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5H3JZnDHei4Ba87P8qtf4+QG1tTAZiOmC3aN62AyUA=;
        b=ms9VV5c4+F+VXEV4IEhWz3O0AGpZa/mMwowtBSLH8QPudX05E7pAhIdV6aNoiwWDLV
         8EBPDGcGIgfqL8ssq+nFAJm6emb6B/NlABSIrNCwTMYYXBtBD0NwErhlOjvldGayV+uJ
         MfyBj4ACHy6HYAB15as7EeB4pzA4Oshn5CnPAbTHpEEfkdlZs+e2orW/gRKbNEjB5i49
         fCxLiaV2VANGEoMLP2zpn5wYg7TyQypTEJIQ3EJ6U9rd481bJgXQ2GUCJajLngY9Hv5N
         WljdU2APGe45hfsJwxSLBZs/hM4Z03fRjfZAPBmdfqrA+NA7qXE5/1MDdRcAgAOJVSbU
         dOkQ==
X-Forwarded-Encrypted: i=1; AL+hErGmg9ezqpGx6b5uHV5ipmE9kK4Skn7HvCp7udjHn5iJb/ZeqjuJtGdZJq017PrC64C44tuJbhLc0YU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G0zUFPPqed0iWLc70T1tQcSKFpWlhnV7S8a1aS8GIOp/XvSRo
	pQd8FURSm+nWAnF91lULBpPMYx8p8WjGTlzsLI1OFmQfpYkal60tm2t4WpC+GC6DuH8=
X-Gm-Gg: AYBFou1OnQcoVGi4K1ctkl08MbpAFkVEvBlvsNjZWFRW9b8JcrGVBCx46Wox+/g8Bds
	xMKyJO63A1jeLKZ+JrzrGawZplfYThBbUa/NoDytIPseRwreAUD7+99i/SyZNbbjjWhCqUaFKIN
	/9eVJPJ8Tduk0cEsJeniAMIh9BkpZvjFm5qos5scO95rGSxKKe/8rAi8sQH8wQAU6l/F3dB3trK
	opQCA30+1qf+dmgENkC7zUkPEcOXVr5Hzf19CJNC73KxVEF67JhIS2tzUdAnwIp7NvRCtYHyrha
	9iUfiTdGFR3bOLadjGv67hha/V+ANlOznY7TbC9Cn3HUh57VHxipzZSIDZFrNc+s3Hjef8NKnvk
	QG8i6hKQCBNXexoR+sKllfK9kY6CsTeX5h5KzCBg46o7f9pvDphWkVaQ3kH1DBqrh5jqqdM3jXS
	N0yS8vzM8+4Zw9LZQHv3SnXek4WLjQ6sgDqwZRqLTLKCcAc09BZY/ChNpCTxk/zwSpGxqatRi26
	rQQwHpgN6me/fvqbOBM+hzyG0OnJHrBYdMk4exGm5Br4lS24wpcnuphpovHgk4B6PPi7U6NCgff
	MraePW057PrHC72fMVD345O0LdArLTkr3jtzVkM=
X-Received: by 2002:a05:6820:806:b0:716:f44b:2dd8 with SMTP id 006d021491bc7-7191785b304mr4102008eaf.31.1794499925700;
        Thu, 12 Nov 2026 08:12:05 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e257sm84600a34.1.2026.11.12.08.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:12:04 -0800 (PST)
Message-ID: <67b2c06e-0caa-4ba1-89ee-17cb814d173c@linuxfoundation.org>
Date: Thu, 12 Nov 2026 09:12:01 -0700
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
To: raoxu <raoxu@uniontech.com>, valentina.manea.m@gmail.com
Cc: shuah@kernel.org, i@zenithal.me, luiz.von.dentz@intel.com,
 pengpeng@iscas.ac.cn, brgl@kernel.org, pmenzel@molgen.mpg.de,
 gregkh@linuxfoundation.org, ihadzic@research.bell-labs.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <E063498E65C71B8D+20261112121648.1458957-1-raoxu@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <E063498E65C71B8D+20261112121648.1458957-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 05:16, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> process_request() forks a worker after accepting a connection, but the
> child only closes the listener used for that connection. All other
> listening sockets are inherited and remain open until the worker exits.
> This occurs when usbipd listens on multiple addresses, including the
> default IPv4 and IPv6 setup.
> 
> A worker waiting for a client request can therefore keep an unrelated
> listener alive after the main daemon exits. Restarting usbipd then fails
> to bind that address with EADDRINUSE, or starts with only the addresses
> that are still available. A single-listener configuration is unaffected.
> 
> Pass the complete listening socket array and its count to
> process_request(), and close every listener in the child before handling
> the request. The accepted connection remains open, and the parent's
> descriptors are unaffected. Make process_request() static as its only
> caller is in the same file.

Looks reasonable to me. How did you find the problem? Can you share
how to reproduce this problem?

> 
> Fixes: 328f7f8a0a1c ("staging: usbip: userspace: eliminate glib dependency")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   tools/usb/usbip/src/usbipd.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 3e22b651c754..5ff5b46674a2 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -339,17 +339,20 @@ static int do_accept(int listenfd)
>   	return connfd;
>   }
> 
> -int process_request(int listenfd)
> +static int process_request(int listenfd, const int *listenfds, int nlistenfds)
>   {
>   	pid_t childpid;
>   	int connfd;
> +	int i;
> 
>   	connfd = do_accept(listenfd);
>   	if (connfd < 0)
>   		return -1;
>   	childpid = fork();
>   	if (childpid == 0) {
> -		close(listenfd);
> +		/* Do not keep unrelated listening sockets alive in workers. */
> +		for (i = 0; i < nlistenfds; i++)
> +			close(listenfds[i]);
>   		recv_pdu(connfd);
>   		exit(0);
>   	}
> @@ -568,7 +571,8 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
>   				if (fds[i].revents & POLLIN) {
>   					dbg("read event on fd[%d]=%d",
>   					    i, sockfdlist[i]);
> -					process_request(sockfdlist[i]);
> +					process_request(sockfdlist[i], sockfdlist,
> +							nsockfd);
>   				}
>   			}
>   		} else {
> --
> 2.50.1
> 

thanks,
-- Shuah
