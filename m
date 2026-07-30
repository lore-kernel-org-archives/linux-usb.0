Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21A3793D5
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 08:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398597; cv=none; b=qSQ1RlqGg8/wZjUv0UXK8U6GZTbzWdfcN226BiPAeP+D+knpCyL559kBlacUaQNG6ad4ag4QoV6piR+tT/AHs8NZu1vsUQ1Mam7Qd4PqIchB2zcsMi5KPuxNvhrF7c2OpgAqkt3Ew7CNgxxbWRFchfFxuFgjEvHzy4x/ApLvlJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398597; c=relaxed/simple;
	bh=ezuhHuCrV3TRi42BFtVAhG17FZnzU3jUakeKIfXKLqE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SpWCzHvRyh1nseKxKjIlR0p3x/cNVC7qKA+MA/NWwErw0NTWRG8N+PeNuetQ2VRqSF0wfzrTk9r5colSmhsVNSSWIpQLZ/oC/DEq28OjZXtF1yKd4cc6X/+dvxGTfQdi/ApTX1VV7T2x6Q7/Mb3CkfNNh/z3GZvJu/XD9SgtXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrDL7kDK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrDL7kDK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso12625355e9.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785398594; x=1786003394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hM7il7IHhtlK6cgjtwSBnnJLoyvPA+VMinfSksQjTmA=;
        b=DrDL7kDKiO3CIw49ad3twNyTGwsUX9dg5w1Vn+NbNxuzFnP5luaPPZ7GXg6tJcFNKz
         aIFeBXPHLrezSQFysXPDp7rz2DG5Ne1Y+x7mqNJIhWDapg0rJvFi5eZZMpByijU2MwZw
         VhtPg3q7O5tTlGi4b1FY+Thxq/Z6gH8hX7cum+utCZKtW3DUOFZDxow4XpZy4SEvOWTC
         ooA1ACkzyGv7xfUjxjjE4PXEkZBsIbDBpxqKxmR/qWLwJplRzSi7K8Nn62WHXRKRiC0S
         6BjcAKzmnNw8+q4OQmL9+SymeZp9YvMUlL7s4RdQ5H+DAJGTA68bOFYhoB2G1N+T76qP
         vOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398594; x=1786003394;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hM7il7IHhtlK6cgjtwSBnnJLoyvPA+VMinfSksQjTmA=;
        b=TjN0jyDXfN+Y34vaetQchmMxd/pEzdUKDOjCxXpzfrjOuMn87qijTpitfPlPez5RLQ
         cHkhGJf1HAIM5/mWcjxWbN58c6+9YtagKxjx6Pk5LRoar9V+AJHifMGFcmrGJGy4GsDk
         DhH0pKrbwBaEqBYednsY8lasvvJooaWvRuY9u4zCQZQS3NY8VMNgJ9VHDJX5k349Kiuu
         eQqHtGS1jel3/StrKj/QSry/9O4hKq+jOEMip/XhnJeJhKmgJxTQHsK0bzL8OitahraB
         JqeouFpIObTqzC1hCZZDLhBWg9rGDkSHMhMwu/7IwZ7ledKCDnsNxsbVmvTHAbxKi7xA
         QgZw==
X-Forwarded-Encrypted: i=1; AHgh+RoO/9YqT2vtDIv460LPIC01ciKve77ryrJe8yB1Q6qD/iaaCcNdItVFAFVQeTnY2GAunirgoNQ+FbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3uKjcbMYBWXRkKeneEUhZazKVk5rXSw4Jvmj7i/OJmgNzCm93
	XFqorannXQWIUyCFMP3tGamoWlRGg8qli21usLSXCivPNro6mjNXN/qw9TGHpg==
X-Gm-Gg: AR+sD120/5iI0PFFJG9N/DRB0vPjrjZ9N6HwCpKRMjfQAku4D4AgGdXolIziVufPZjI
	HDjv3DRnnbXb4sjKWSzqU1EMwa7YqfYmYiyXRVrWsGbqJBnAvRc2FodgZ+bJUY1qsiC67akWLC4
	YlqLI6wcFrWjhEdJVs2p9FTg87mZbs1csZgWNe6oSgzz4HhmWusjUPxCl69G6nX4mXSc4ENfF4P
	rDxv0qpaw2TM1pLmaQN+A+2Fllwm63/0CV/sOHBxzg1CT1TXsGMX5tMg1gOZBwt38n9jGngmMzd
	mnYGwEq7D7E+qKAshH0QUOt1UDYq9EawldWHBVxhORBrw1NjAuAMOwn4aQFLEJOoZrzQ05AE+Gk
	F4xlx88cNT69jgzggRPB27seEJ0rStk4QH+h+3tXxGMV/BbJvLklMWaam1MvRfn6nN7JadHuc/s
	6e0icVzPx74FhVxGZGtMPnNDnzLc4jyrC3RPZrrkEocPOqg5/JxHrZRiyPloO1s1vg6841kw==
X-Received: by 2002:a05:600c:1d2a:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-49800eb97aamr19495115e9.34.1785398593978;
        Thu, 30 Jul 2026 01:03:13 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e439asm3633471f8f.11.2026.07.30.01.03.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jul 2026 01:03:13 -0700 (PDT)
Date: Thu, 30 Jul 2026 10:04:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
 linux-usb@vger.kernel.org, arien.judge@morsemicro.com
Subject: Re: [RFC PATCH] usb: xhci: use BIT_ULL for CRCR bits
Message-ID: <20260730100434.3354b600.michal.pecio@gmail.com>
In-Reply-To: <20260730054521.296139-1-lachlan.hodges@morsemicro.com>
References: <20260730054521.296139-1-lachlan.hodges@morsemicro.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jul 2026 15:45:21 +1000, Lachlan Hodges wrote:
> The CRCR register is 64 bits wide - commit abe93f27cdd7
> ("xhci: use BIT macro") changed the flag definitions from (1 << n),
> a signed int, to BIT(n), an unsigned long. Within
> xhci_set_cmd_ring_deq(), the following operation is performed on the
> CRCR register:
> 
> ...
> 	crcr &= ~CMD_RING_PTR_MASK;
> 	crcr |= deq_dma;
> 	crcr &= ~CMD_RING_CYCLE;
> 	crcr |= xhci->cmd_ring->cycle_state;
> ...
> 
> Previously, ~CMD_RING_CYCLE was ~(int)1, a negative signed value
> (0xFFFFFFFE with the sign bit set). Widening a negative signed int to
> u64 sign-extends it to 0xFFFFFFFFFFFFFFFE, correctly clearing only bit
> 0 and preserving the 64-bit pointer written two lines above.
> 
> After the change when running on 32 bit kernels, ~CMD_RING_CYCLE is
> ~(unsigned long)1UL. On a 32-bit host this is an unsigned 32-bit
> value (0xFFFFFFFE, no sign bit). Widening an unsigned value to u64
> zero-extends it instead (0x00000000FFFFFFFE), so the subsequent AND
> silently clears bits 63:32 of crcr, truncating the command ring
> pointer that was just written before the value reaches hardware.
> 
> To fix, similar to how CMD_RING_PTR_MASK is defined, make sure we
> use the BIT_ULL variant when defining the CRCR bits.
> 
> Fixes: abe93f27cdd7 ("xhci: use BIT macro")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
> ---
> 
> Hi, I experienced this when running the tip of wireless-next on
> a raspberry pi 4B compiled for arm32. The main symptoms were the
> following log message:
> 
> [    0.549897] raspberrypi-firmware soc:firmware: Attached to firmware from 2021-02-25T12:11:39
> [    0.626859] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [    0.626889] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
> [    0.812619] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci version 0x100 quirks 0x0000200000000890
> [    0.813188] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [    0.813203] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
> [    0.813219] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
> [    0.813602] hub 1-0:1.0: USB hub found
> [    0.814052] hub 2-0:1.0: USB hub found
> [    0.952714] xhci_hcd 0000:01:00.0: ERROR mismatched command completion event
> 
> Additionally running lsusb just hangs. Running the same kernel compiled
> for aarch64 worked fine. Bisected to the commit in the Fixes line
> above. Additionally a USB device plugged in to the USB3.0 (or 2.0)
> did not enumerate. Once this patch is applied the USB device
> enumerates properly on the tip of wireless-next 4a0bd262df75 ("wifi:
> mac80211: fix per-STA profile length in cross-link CSA parsing").

Makes sense, including observed symptoms.

A system with IOMMU would fault on top of that, but the accesses
are reads, so hopefully no corruption in absence of IOMMU.

> Happy to test alternate fix proposals! Thanks.

I think the sort of code you quoted should work without surprises,
so widening these macros to ULL is right.

And there is a few more. They currently don't break anything, but
neither does CMD_RING_ABORT or CMD_RING_RUNNING for that matter.

ERST_EHB
EP_CTX_CYCLE_MASK

Let's see what Mathias thinks about it.

> 
> lachlan
> ---
>  drivers/usb/host/xhci.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index d02046a573e4..df014855c659 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -190,13 +190,13 @@ struct xhci_op_regs {
>  
>  /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
>  /* bit 0 - Cycle bit indicates the ownership of the command ring */
> -#define CMD_RING_CYCLE		BIT(0)
> +#define CMD_RING_CYCLE		BIT_ULL(0)
>  /* stop ring operation after completion of the currently executing command */
> -#define CMD_RING_PAUSE		BIT(1)
> +#define CMD_RING_PAUSE		BIT_ULL(1)
>  /* stop ring immediately - abort the currently executing command */
> -#define CMD_RING_ABORT		BIT(2)
> +#define CMD_RING_ABORT		BIT_ULL(2)
>  /* true: command ring is running */
> -#define CMD_RING_RUNNING	BIT(3)
> +#define CMD_RING_RUNNING	BIT_ULL(3)
>  /* bits 63:6 - Command Ring pointer */
>  #define CMD_RING_PTR_MASK	GENMASK_ULL(63, 6)
>  
> -- 
> 2.43.0
> 
