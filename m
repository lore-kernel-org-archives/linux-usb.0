Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1B2C0F6D
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 22:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786488527; cv=none; b=SsXVq9CyO46vjHTIUOxFpaxNB8fdLMYRMmCUULCKN9mtbKNO9I7Cp1N4LGt7g7VoQjmYF3kOXEoAfBCeWAabIxceavEeVzMWaG8kmrDXiu9J7vN8eTNLAcWaD7NfZbuXRwgaMscR2rgS2NvetCAFEoRHz50ZUQgsv/vtoVwh5WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786488527; c=relaxed/simple;
	bh=piW5qjtiPWkw4LU+yvxw3yZycgE07lwFSDBsxW8SHSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1eyNQGyqjwZDq7a8km3GtwK6s6znS1h/0554BgIdPqPij/fovoGZav9BpoTP0s932GRT1Lipp6xZSCcAXbjXmdGOxzOcDkj5NFtyFEZvOlvfU23VZ6DUXANPcf5FQCkqwezIeZ2+hO1+eo+DoXPw7xvXdxlAoAMAibtL6MWYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UY9Fjf6I; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UY9Fjf6I"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-448b0ff4a57so337201fac.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 15:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786488524; x=1787093324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWf7t0J9zKpnW/lPJBg7TGDxdXOi7Iv82pnKCI2dtOw=;
        b=UY9Fjf6IRTbjChS/2qaWtgXQXHC0iVmmGo51yOcWiFuCTXUixrJ/mSzX2vYe5vtjho
         d7wbzrQVmU5s/GBkdXCYC63izQdgRc0Z/xbndlwsiwXQkTJfYjX0QbaJBzI9wq0PUejn
         OWBVDXSxXf2CM9QhHoZaTKJaQZrsItYMWE2do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786488524; x=1787093324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWf7t0J9zKpnW/lPJBg7TGDxdXOi7Iv82pnKCI2dtOw=;
        b=FJPJSFB3UCvIKl+4WqQSK9hk3TYr6ERrPftSLEgzMCKQEb28uiDvJF3y9W6hW1PJVO
         2SJikE2WzrXQYh5mOAi7CdgwFAjyRO+erEQ6qNryYUKosdKgVWdghSrJTec4s5BnahtR
         7M/H0mXFFCvK+RGe1R7/HAfLH11tbwYUdcyWvsNPL79kqnOqvaYhkARMCN1xK9/Q9wEs
         dyAnFZapYMuxHZk+Po39zS7k0ca3a8xPPV0nfHFsRvuKbT9IvwXiY+TJcZBJY3bNJX/K
         N/ulieHwwg74uWylr+W5YnD+6Ac7rQGnkU7nvm4zqzkzDuns1KqBpw32MP+sTX6DnjF5
         ACyw==
X-Forwarded-Encrypted: i=1; AHgh+RotRh9eCGekrGQGstguV8lhTiXAyyL96lpbjH/rVw//CNhexcXx967U82tgfQqeTv+f+Bmh6oBXuLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2TljrsUMqu7k6AYU3y/vk+Xg1DBgIV2m9Vh1HQYyJTXX6/y4c
	rXvTYyZ4Cvn/Kz/tF+uC9A0CRNeaF+D6+QpRXHrSN45CFo7O+nxzEufIu+7GO9AK58S80gd8vLM
	GxVPMPs4=
X-Gm-Gg: AR+sD111ts+TFrqMzMJqURXKogFLo3JnJjBKAYR4OaZT10Lt8zF2nPy+nY53QQPLX8n
	/kQsT0JHA9G9H/27fciVaoJP4VgSzmlHZYMv/yvXB1RcEjZp9PsIAx7hBo//hNdZH5Iz1DlSpTQ
	JuiHhycaU52lRLdRfy80D4QNQXHGdsybdfsY3GM/LR7yR59/YLxBjGT1wGDILWELpWUeAvXKT+I
	1gL7U4CZgorI8fJKvlrxL0AUb/3jOrOe+qoU59C6XzMftVZK08GjUMW2t4fIXidJH6j66Lf0qAF
	KPPTEbPBX/RXLdb5GnQ1rijCxpkWeJtgQQ+UhdNd14AC54MRJVsC6GsBdeLIA8FkWAshzWU+TTN
	uEtT1SA8ruhqvrxMvzAx17wQGnY23oWRCuAKgq5sNzGL7WutP/+u0XyAjAU0xgEXFTGBjaRZy7a
	Tz6YNcvpLBiqB1c2dH1Y8Liq5ceYVn9GhqoIsicvQU429JA/H8gd51IL/SV8DVqYAnYKHn0A==
X-Received: by 2002:a05:6820:1f0f:b0:6b0:4a08:17d9 with SMTP id 006d021491bc7-6b0b2ba9c32mr283831eaf.28.1786488524055;
        Tue, 11 Aug 2026 15:48:44 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0ad500d37sm969208eaf.7.2026.08.11.15.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 15:48:43 -0700 (PDT)
Message-ID: <2e6a5558-3bc1-4b5e-a9e1-cc03f0e5663e@linuxfoundation.org>
Date: Tue, 11 Aug 2026 16:48:40 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] usbip: make remote list honor parsable output
To: Jason Colapietro <jasoncola1@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>, Greg KH <greg@kroah.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <CA+Z0x2KotE5hgrFn-vzR+XNF_H_vEbZcE_nXmpVz5F2q1vxE6w@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CA+Z0x2KotE5hgrFn-vzR+XNF_H_vEbZcE_nXmpVz5F2q1vxE6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/26 21:42, Jason Colapietro wrote:
> The -p option only affects local devices and gadgets. Remote lists still
> print their human-readable headings and details, so scripts cannot parse
> them using the documented option.
> 
> Pass the parsable flag through the remote listing path. Emit the same busid
> and usbid record used for local devices while continuing to consume every
> interface record from the server.

What happens without this patch? Can you elaborate with some examples?

> 
> Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5
> Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
> ---
> Changes in v2:
> - Make the email From header match Signed-off-by.
> - Add Cc: stable@vger.kernel.org.
> 
>   tools/usb/usbip/src/usbip_list.c | 33 ++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
> index 3d810bcca02..b9d60b87e47 100644
> --- a/tools/usb/usbip/src/usbip_list.c
> +++ b/tools/usb/usbip/src/usbip_list.c
> @@ -41,7 +41,7 @@ void usbip_list_usage(void)
>   	printf("usage: %s", usbip_list_usage_string);
>   }
> 
> -static int get_exported_devices(char *host, int sockfd)
> +static int get_exported_devices(char *host, int sockfd, bool parsable)
>   {
>   	char product_name[100];
>   	char class_name[100];
> @@ -80,9 +80,11 @@ static int get_exported_devices(char *host, int sockfd)
>   		return 0;
>   	}
> 
> -	printf("Exportable USB devices\n");
> -	printf("======================\n");
> -	printf(" - %s\n", host);
> +	if (!parsable) {
> +		printf("Exportable USB devices\n");
> +		printf("======================\n");
> +		printf(" - %s\n", host);
> +	}
> 
>   	for (i = 0; i < reply.ndev; i++) {
>   		memset(&udev, 0, sizeof(udev));
> @@ -98,9 +100,14 @@ static int get_exported_devices(char *host, int sockfd)
>   		usbip_names_get_class(class_name, sizeof(class_name),
>   				      udev.bDeviceClass, udev.bDeviceSubClass,
>   				      udev.bDeviceProtocol);
> -		printf("%11s: %s\n", udev.busid, product_name);
> -		printf("%11s: %s\n", "", udev.path);
> -		printf("%11s: %s\n", "", class_name);
> +		if (parsable) {
> +			printf("busid=%s#usbid=%04x:%04x#\n", udev.busid,
> +			       udev.idVendor, udev.idProduct);
> +		} else {
> +			printf("%11s: %s\n", udev.busid, product_name);
> +			printf("%11s: %s\n", "", udev.path);
> +			printf("%11s: %s\n", "", class_name);
> +		}
> 
>   		for (j = 0; j < udev.bNumInterfaces; j++) {
>   			rc = usbip_net_recv(sockfd, &uintf, sizeof(uintf));
> @@ -116,16 +123,18 @@ static int get_exported_devices(char *host, int sockfd)
>   					uintf.bInterfaceClass,
>   					uintf.bInterfaceSubClass,
>   					uintf.bInterfaceProtocol);
> -			printf("%11s: %2d - %s\n", "", j, class_name);
> +			if (!parsable)
> +				printf("%11s: %2d - %s\n", "", j, class_name);
>   		}
> 
> -		printf("\n");
> +		if (!parsable)
> +			printf("\n");
>   	}
> 
>   	return 0;
>   }
> 
> -static int list_exported_devices(char *host)
> +static int list_exported_devices(char *host, bool parsable)
>   {
>   	int rc;
>   	int sockfd;
> @@ -138,7 +147,7 @@ static int list_exported_devices(char *host)
>   	}
>   	dbg("connected to %s:%s", host, usbip_port_string);
> 
> -	rc = get_exported_devices(host, sockfd);
> +	rc = get_exported_devices(host, sockfd, parsable);
>   	if (rc < 0) {
>   		err("failed to get device list from %s", host);
>   		return -1;
> @@ -351,7 +360,7 @@ int usbip_list(int argc, char *argv[])
>   			parsable = true;
>   			break;
>   		case 'r':
> -			ret = list_exported_devices(optarg);
> +			ret = list_exported_devices(optarg, parsable);
>   			goto out;
>   		case 'l':
>   			ret = list_devices(parsable);

thanks,
-- Shuah
