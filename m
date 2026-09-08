Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26DA2F8E81
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865855; cv=none; b=QchWIVKUxpIgLJTJQ0ROzTmjpI5njph5QjOVxeRc+glHT2IRY9sJhi1p4cvmlje32qzxnJ28rkciAzoTPZbuEqud4nU+Dbr+1njglnaVexpEGM1WkbX0anmtiXX/JL3M3YqDeakGv2BTqdGB15AO6xE6/kRZkhDwYnqGbUIea4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865855; c=relaxed/simple;
	bh=rqHVgMiROJsS3QHZ/2FhNH0eT7u9QW+NHGjan0ZH5wE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hm8RHPmJ0CaHGn7lsB9hcg9NNTYluJHyT+HdPLsU7b08p7lyabDGjWGK8w4DizqUpE3Tc3hxKWSBnMtvRoR2XXJMM1DdGRQy57iOsv7/7oxNwqsj1KDZOYkpAAv1udAGfaqg2uUswM8wMhktZ7mGNo5rlm2mswILneQODqw7xqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5XqdaBT; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5XqdaBT"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c25b661d37dso622312666b.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788865850; x=1789470650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TnGX9akoQ/WbzKgGML/w7POJM/15dtNrSKYlYS+yEis=;
        b=P5XqdaBTrKcRHrud+DUcqDTBPzVJBPEEnbU0EKTEuIWazz3XilyipcUU3Ozm2z1+Uw
         b2CV/n+4VhBPz8gllTrX33QqtLXfjRPs/Z4kEBqiZryynsUvffV+k75U0rxSz5k27brR
         jqIK+25aSQ5smpMvvIwK6jt7e2oUqHnD+u64uHEtHhWTSLhe8OIAwIEf260fZ+hHY7UN
         S7uIWb8wS3XCRvPwIHidBI2lFOEmj9wbtBFnEOFm+XFMAIe+nmQ57KsuMme0xsssbjAR
         QwihSgXH6GrJVcSIIUjt6OUZH7yjFh9JB5CKv6xMwHcaJvncmrvv6RHCYueL9r5BVRds
         DRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865850; x=1789470650;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnGX9akoQ/WbzKgGML/w7POJM/15dtNrSKYlYS+yEis=;
        b=paaEuHS4qdgTH9lwUEFZhwTCKgKhUeITpqQwDGAGNCPMb4zFg5AGk+GQHtIDBiHCE+
         l+OyU6Vzsr2V2bgvxBZauS/xoW5CDYB5kB0uIr3iCiotUqNeebjZn+X8xDe7tLgmUgM2
         qgUHyO+0oGEOScuHR+BPUlkIulm4a8dj5G6Pz091pbuiB410A/Tzr08SGZZ87jZmE2pA
         LUOINU/J68DOpp0Vn33roiNOvgyAXxhzEqZ2Ku9Gz4D7myRnCC1nqu7NGcDykUNsYRy6
         G7TAdfdd23BR2bB0+4/EQhn2mG4I3RD6ZjDH+2CzTEgruhfMNLjnMHb0AsDgTHWCHdJv
         3U9Q==
X-Forwarded-Encrypted: i=1; AKwUvByzl9keshLu725qeETK5/zfJDWDDSKlg2L93DKABhD2Squ/38QmZwv5V6aPGoXGBfanGHkwzD7nGVM=@vger.kernel.org
X-Gm-Message-State: AFuF++k6A27jUfsk/6yTOg3vWqvtJuMT9eUKptKm36erfN4YYBNmkLWL
	irb7nZy6Vja0dAOStNadXKhDcDcNlqVtioLAHKBAPqnbMw5YmshsW4PU
X-Gm-Gg: AYBFou1DOXx+sZCQR19uvZ2VkCiXMfVTezx3gExoGg8ITRHGy4V+jLmajksb2iIx+KH
	amkivVTg+4ufmnHpGL1335S4yWK9qmo7wg02c9O3JjFE9UVfxoTFoRux27qal367LOQunUuexMS
	sEK87jUThhUhX5eZj9QsA1RIxSa0Pq7ddpEAm+7/tD9oZVNodESm3OezC+urCsh/kz0VcoR1Cxw
	ovIHUWIZzyPafsXBoOoWrXnbQ10jRg1bDNxBvP7hP8l3K6m57W1vvPwkZtqe+AXfkSGRJEwf9sn
	doEZR6Vgn9wXbWs9rTkSHMbbrP68ZMuqC6B7WqHUmShU8kk4gdorEA0PbDeQlKX0mKtHcfkY7Ny
	RMCyf+6rf41/3DIZFdlLHnJZOQk5o8uAM2Y3K5uqpAbbsoSVb0GLajQ2iBknpdOJaO8eTxihzaF
	RzBra1ze6I2qPBV635buWE4Ccxr5UFJIA2wJkWYFg6L8RlKFXlp1YmEdKyIKZPxOYTaXzryZY=
X-Received: by 2002:a17:907:8b99:b0:c16:13e7:fd63 with SMTP id a640c23a62f3a-c260c3f946dmr985986866b.0.1788865849777;
        Tue, 08 Sep 2026 04:10:49 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c37csm589464166b.32.2026.09.08.04.10.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 08 Sep 2026 04:10:49 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:10:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wakasio <scarabeeta@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec
 0789:0308 during DVD+RW recording
Message-ID: <20260908131046.1fa7034f.michal.pecio@gmail.com>
In-Reply-To: <20260908104935.13248-1-scarabeeta@gmail.com>
References: <20260906122750.1c71f176.michal.pecio@gmail.com>
	<20260908104935.13248-1-scarabeeta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  8 Sep 2026 19:49:35 +0900, wakasio wrote:
> Hi Michal,
> 
> Thanks for the link. Bug 220936 looks like the same issue, same board
> family (MSI X870E), same controller, same suspend timeout messages.
> 
> To answer your question: no device was connected to bus 5 or bus 6 at
> any point before it happened. Full sequence from that boot:
> 
>   10:59:35.014709 xhci_hcd 0000:77:00.0: xHCI Host Controller
>   10:59:35.014756 new USB bus registered, assigned bus number 5
>   10:59:35.014848 xhci_hcd 0000:77:00.0: xHCI Host Controller
>   10:59:35.014893 new USB bus registered, assigned bus number 6
>   10:59:35.014938 Host supports USB 3.2 Enhanced SuperSpeed
>   10:59:35.015160 usb usb5: SerialNumber: 0000:77:00.0
>   10:59:35.015534 usb usb6: SerialNumber: 0000:77:00.0
>   11:00:48.349628 Clearing Run/Stop bit failed -110
>   11:00:48.349744 PM: suspend_common(): xhci_pci_suspend returns -110
>   11:00:48.349812 can't suspend (hcd_pci_runtime_suspend returned -110)
> 
> Nothing else touches bus 5 or bus 6 in between. This was autosuspend
> on an idle, empty controller, about 73 seconds after boot.
> 
> After that I tried unbind and bind on the PCI device by hand, that
> did not recover it either:
> 
>   11:03:30.975422 xhci_hcd 0000:77:00.0: remove, state 4
>   11:03:30.975812 USB bus 6 deregistered
>   11:03:30.976136 Host halt failed, -110
>   11:03:30.976262 Host controller not halted, aborting reset.
>   11:03:30.976325 USB bus 5 deregistered
>   11:03:33.058079 can't setup: -110
>   11:03:33.058350 init 0000:77:00.0 fail, -110
>   11:03:33.058416 probe with driver xhci_hcd failed with error -110

That's odd, not sure what excuse it could possibly have for refusing
to halt idefinitely in a completely idle state.

> Separately, I applied the TRB dump patch on top of the previous two
> and reproduced the write failure again. Same pattern as the last two
> times: 11 soft-resets then a hard-reset, all 12 Transfer error events
> at the same TRB address (this run: ffffd140425178e0) with the same
> resid (23552).
> 
> The dump itself printed fine, event ring and endpoint ring, about
> 1061 lines total. I could not tell which dumped entry corresponds to
> the failing TRB though. The "Transfer error ... at %px" address is a
> kernel virtual address, but dump_ring() prints each TRB using
> (u64)seg->dma + offset, which is the DMA address. I do not have a way
> to convert between the two from here, so I do not want to guess which
> line in the dump is the one that failed.
> 
> I have the full dump saved. It is about 1061 lines, too long to paste
> directly into this mail. Let me know if you want it pasted anyway, or
> sent some other way, or if there is a specific part of it you want
> first.

We should be able to find the offending TRB by looking at transfer
events. 1061 lines isn't huge, you could send it as an attachment.

Regards,
Michal
