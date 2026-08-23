Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7223CF1F1
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487827; cv=none; b=uhsI1tX/8Ps+H1pcT3UWBZzBDkoBJFeLwYfv/Ofcd2/gl4jW/+7AH1BqNt+QfyfrHRE0FGzOTpbH0HC+rhpDEZSOptBGPtERaHAAHaeIoEskFrQWbRm5MwgUY3jB/o3omKCLpiQYBQvrQpcjd/mnD4dEAEY1AE5MU8y5sllk6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487827; c=relaxed/simple;
	bh=w+d9w1cHPKcUEvNAsFTO0hwvEvTQddz2PQ04qaQqf34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6rXva/WaXsm9XDFavd9Rl1tPct46irrhvJKjTTDA+g7XBcP4wg3l4w4n6UVvdl75xNe3vqsmF2NValZZYAC6W0TT6Lk1+XXClTudB0vVDT9ASAQKjELLMI1HFbIQ/OyjjiJ+7Y0vItfdPlCvTOfz5pSA7QwxWgveTN2IOiP1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1M/ExT1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1M/ExT1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8486672f03cso2575453b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787487825; x=1788092625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRPHlf237WPmPMbjSWkUAAAD3V69PehMi7CL3D6QNGM=;
        b=h1M/ExT1GBvBKaEDIyOt51itmQxTo3RaQPpKqTa43gNJqtlgH04jHi5gh5zoM1S6n1
         A5SLhYrrOLvJdy5rQoRvjo8Kz9BUTVhqoEaKFXMjOny0z4jjSdnuQGrmBx22uBnwW7MU
         DsGHlpOND8jWBmQITXMsAZykkR5qxx1AQSHMxKcGMjNIqu3ZZTgnNXlqwVvDa+pB3giA
         +apv8wrM6H8Bwzp5fiZtmk10ZmfY9SRZ+/vz+MPUU0UCW4olbOoz3+7nkO9IsKUGgEQe
         RZOWP1QQ8tmlxi/i3oXupotIsVd8/7qZK3MrUTFA97Wp9jFeMej+4k+ApqSxhMmcMrV0
         53lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787487825; x=1788092625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRPHlf237WPmPMbjSWkUAAAD3V69PehMi7CL3D6QNGM=;
        b=gZEoNjCPiuH/8UOQGf6jh9IO9FhX9gO1/HIypiHNnRFrT1SI/LmZYN6hQgkSpxRu3K
         3U6PSxLsAek41odDqn03MOZf11qVYN8rBDLQpZKdQ/wgsa3gkr4YLj2PSx8vJfDsalDB
         BDaRnznloRkF8fRAIrDSgIGZNd3ZI6w1uWdINUH9afl1ogumoRdrtB6kN7iSVEiV/sRr
         PUuJmvb9MeJMZ3YQhYS1zuN6saCX0YCrKTIXmV8tyVU2NXQtxh4O70qR4zm6OqMlkiPa
         aK/bPix0gWQeo1HBsM1DRPrhKEucWIYEN8KjFTpOedufw3TkpEMULREfalRgIi/ygui5
         k6fg==
X-Gm-Message-State: AFuF++nmjZiPNcaVjUd7KvPMc85+3skajBtsoY8RnSRYNKCoK6ZySABs
	TNM7TvHUI3qIy8xI+fjsNHY6Xfqs2+sdp6v5I1yC8GCjSrMFWNA98+2hM6DtpQ==
X-Gm-Gg: AR+sD12ZacstfT1wjIIYmrd60hPNnWQ6xZG48lPD4V0InTaYM2nGF1/I3CcmOhrYWCe
	hx3hyTjui6hlFQ2jylhXD/Ps1FDfzXF8skK9tSt2wrU2Vh9wAoBvwzpdNirIilDxMbexN69Cqbf
	GvV18V5x+aUVA/GwYmkiKKJ/uIplZLiJqb/Nsj0wEbgaP1od3nZgEswJR57WUOiokHD2oK/MURw
	g8g+musrlzwW84PEHQNjgymx8Rf6MjetF1FWp+mnVD1jVXHyoI5YlsthY4FgPPt9rENxou4rttz
	REd2v8H5TDB/X1tS7wxXPlTED2nefHZn2fzENY2vvOOl+13AUHNebP+NiM4hkaasPqwNAZFjllw
	btt/GPzWUAa6Wd201UNmhj43N3RnAF+LubDn0CwuAgxRab2lUeCoiUs8sxjLrPmcWU1sc92+Rna
	sUjGtcQN9QXAVuHqzsxSjGuguuOdULLziS2VhEW14SH2MC4hAAJeoAYI65g2WA4VToyFaciA==
X-Received: by 2002:a05:6a00:1808:b0:84f:a170:4f5b with SMTP id d2e1a72fcca58-8520b984b8dmr18042074b3a.8.1787487825439;
        Sun, 23 Aug 2026 05:23:45 -0700 (PDT)
Received: from [192.168.90.3] ([175.235.236.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e4b2e3sm254715a12.16.2026.08.23.05.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 05:23:44 -0700 (PDT)
Message-ID: <391eb22c-e893-4c0d-a4ae-d603d568b12b@gmail.com>
Date: Sun, 23 Aug 2026 21:23:42 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
To: Stephen Horvath <linux@stevetech.au>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20260820-xhci-pci-prom21-v2-1-638e5958fbbf@stevetech.au>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260820-xhci-pci-prom21-v2-1-638e5958fbbf@stevetech.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/20/26 21:59, Stephen Horvath wrote:
> It seems the xhci-pci-prom21 module only has IDs for the 800 series
> chipsets. However, the 600 series chipsets also have Promontory 21
> chips, so we should add their IDs to the list as well.
> 
> I have tested this on my X670 board featuring DID `0x43f7`.
> 
> `1022:43f7` also appears on the PCI ID database
> (https://pci-ids.ucw.cz/read/PC/1022/43f7).
> Device IDs `0x43f9` (B665) & `0x43fa` (A620) were suggested by Shyam.

It would be nice to update all the newly added device IDs to the kernel
documentation as well.

> 
> Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Cc: Jihong Min <hurryman2212@gmail.com>
> Signed-off-by: Stephen Horvath <linux@stevetech.au>
> ---
> Changes in v2:
> - Added Device IDs `0x43f9` & `0x43fa`
> - Link to v1: https://patch.msgid.link/20260818-xhci-pci-prom21-v1-1-6584857e654d@outlook.com.au
> ---
>  drivers/usb/host/xhci-pci-prom21.c | 3 +++
>  drivers/usb/host/xhci-pci.c        | 3 +++
>  drivers/usb/host/xhci-pci.h        | 3 +++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci-prom21.c b/drivers/usb/host/xhci-pci-prom21.c
> index 6486f4a09345..5f088a47d79f 100644
> --- a/drivers/usb/host/xhci-pci-prom21.c
> +++ b/drivers/usb/host/xhci-pci-prom21.c
> @@ -111,6 +111,9 @@ static void prom21_xhci_remove(struct pci_dev *dev)
>  }
>  
>  static const struct pci_device_id pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F9) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FA) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD) },
>  	{ /* end: all zeroes */ }
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index a8889081ae82..b407676808fc 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -701,6 +701,9 @@ static const struct pci_device_id pci_ids_renesas[] = {
>  
>  /* handled by xhci-pci-prom21 if enabled */
>  static const struct pci_device_id pci_ids_prom21[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F9) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FA) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD) },
>  	{ /* end: all zeroes */ }
> diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
> index 11f435f94322..533efc7db801 100644
> --- a/drivers/usb/host/xhci-pci.h
> +++ b/drivers/usb/host/xhci-pci.h
> @@ -4,6 +4,9 @@
>  #ifndef XHCI_PCI_H
>  #define XHCI_PCI_H
>  
> +#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7	0x43f7
> +#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43F9	0x43f9
> +#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FA	0x43fa
>  #define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC	0x43fc
>  #define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD	0x43fd
>  
> 
> ---
> base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
> change-id: 20260818-xhci-pci-prom21-ceb025d484a8
> 
> Best regards,
> --  
> Stephen Horvath <linux@stevetech.au>
> 


Sincerely,
Jihong Min
