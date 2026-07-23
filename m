Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB3397E89
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 06:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787288; cv=none; b=D3aQkro8NpO03OsE3XJSSVvPoPUxs2y829MrBJgg8NZGHY1btzuF8gkt3IKb/IfVJF8kHMeQOC5nniDbyjNjy5pmJ4jnH43SzEZ/wNttO8vgsXBXARgOqmov4ifOb9H/106aSn3xsnMI7uJhlaAvvGsXuWgLMJBkI/iijxzWFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787288; c=relaxed/simple;
	bh=NPmbwtJr2E/UPjWCSneA2qtMN+VpJXz2DLdDaAd6J94=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/7eq45Jpyu14f2ZAlvrNsHr76ygc5ncGjcNkN830Z4xablyEQlwQ6DV4clxjm/z1lOQeITqvb6V6yAxRQZS4n3kQ6Edu/ibZOVGbe9n8D9AaQ3PRDcoWQfNROQaxpHXdYX9OZMTm+wCtirZsjbyY2ofJLWBxyqJk485ekyJF38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb4pRkQC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb4pRkQC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f84023916so214064f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784787285; x=1785392085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TVQlmTDEKKPlvdzPQSsbesuIpA+A5Hg3CbFLS1Q1QXE=;
        b=Gb4pRkQC742cknUTQrYooJIJw8BkCDc6VqN1Do+l9h4LWWgFSLQPWIdwKX1bWF10aY
         zifGyd4DuNu7QiBxNHcpfvduqhGZUUWytyeS6sQ4Pksn9ylZ3vlPgxRZu/wI2lsQRzXv
         rPh6Wqwh3ktEaI1G8fV0q5bIQCEQn+lBpmgjwdKxJ3S5ie5xH2xiCbYTLuZBQVaURSBy
         4ERAiyJf5D8vSpwcE5RJhxlqx4FcdJZahYYt0yRIkgZOfXG/rhgsyr9Xh+xqZ9tPkGV0
         eUPz53GUUCze02vnGvHxBXDV8ISrNTQ8uvoUkDwpt7Xc8UXJREL+1mzz12jxv6bDiWgN
         S6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784787285; x=1785392085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVQlmTDEKKPlvdzPQSsbesuIpA+A5Hg3CbFLS1Q1QXE=;
        b=mZwY1KcXh+VuNlIMSifursbFyzO/tOKbz5EG9lTHtmmkPGp8HtiKYy1q6HgJEZfrN0
         YjE34WdvUvfZHmXhJ4tMqGDIY5gzCHBlPwajQ4us5TgjZVfekMXn9rt4sDCgPiZn7Y1/
         xCYg9Z2AxRKIaBOG/T/FXlLWDndgTCTeK0SH30Bu4xLm8aWsiVQDU36+FHZNU5om6Daq
         8FTe52vJ/9rliUIRo2XtO+Curm+9WJni9i40qDnRW4OZIt0z2ZO22U3luSzn5OgGXs1O
         +3g8NGzwABh1spNH8ZEuO7Ga9mw4xpco+eRD8q0DauT9QnaOLS6X89CfjwX6YViz1MtZ
         n09A==
X-Gm-Message-State: AOJu0Yy9Ni8sXzQjcJDu7By8II16waP/VhY26QnBDO9bJULW5GoIco0w
	lgUnZkld92Q6UAx5z0ylRdelsB0KIDsE8k2lZ1b+RtNIMyhwqSPaQj3msRefnw==
X-Gm-Gg: AR+sD13b6F5WU1YELClYW+y4+HT3Ap0AItj5H8oRIvz9JXxlvnMFGwdkANF6J83VMPk
	cPiWXFzc7E9hMxyIKVkLQlFY7zHnR4DlMtCRww/i2Q4Z7kve8jbAvQar9hFISDUNjKJdbiyWmeB
	16iCPqqpWDiCkMN/71bsadjvo+dy26QEbpJeaGOvurbMy3Tf/Fx8yvMtWIvo612g/TKqfOrvRmJ
	V/OfqbdqO1ZgTKr5ulXzh5eb2Kje5rBg26BkHXQTmaI4b7ZsjrLLMo1r2rbE1LRTROP33qKW/cZ
	m4w2C+CdSlEiuQWprdHoP8ZWNIwcCd0Jg1GWhq55aekD8DwbkEcPaN4NWao6TfAZ3sihe9UtaiL
	npD6D+L5Vl17Y1DZ/McNXhinMJQ56g5mmvqZ8R7rDiYhtDScTwSY343xYWkBj1cKBJlXBxqriY1
	uUAcgKo4sTA5ji0ed1YwxdHA==
X-Received: by 2002:a5d:64e4:0:b0:47f:4ba0:6950 with SMTP id ffacd0b85a97d-47f8d71101cmr1922895f8f.2.1784787284972;
        Wed, 22 Jul 2026 23:14:44 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a596sm13002104f8f.4.2026.07.22.23.14.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jul 2026 23:14:44 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:14:40 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260723081440.0228c59e.michal.pecio@gmail.com>
In-Reply-To: <amFNBLzwUdZhqpup@spiral>
References: <al_hchyOdPoPWKEo@spiral>
	<20260723002256.44aa664f.michal.pecio@gmail.com>
	<amFNBLzwUdZhqpup@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 16:23:28 -0700, Bart Nagel wrote:
> > You will probably see Missed Service Errors being logged
> > occasionally, likely both on "good" and "bad" kernels. And it seems
> > that good ones will recover every time, but not sure about bad
> > ones. Does the first MSE break things forever? Or does it take a
> > few? Could you post a log when it breaks? Caution: you may see
> > thousands of lines per second.  
> 
> I'm still on the asterisked kernel from the list above at the moment
> (appears to be "good"). I tried enabling this and I do indeed get a
> few of those errors and they seem to recover. This is what I have so
> far after having set it about 5 minutes ago:
> 
>     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
>     Jul 22 16:14:52 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
>     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
>     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.

Please use 'journalctl -o short-precise' or simply 'dmesg' next time.

It seems these errors are happening in bursts, sporadically, but much
more often than your failure rate, so 'bad' kernels handle most of them
fine and only occasionally something goes wrong.

Per your other email, affected hardware is Intel 100 series chipset
(8086:a12f ?) USB 3.0 controller. If you run 'dmesg | grep hci.version'
I suppose you will see version 0x100, so it's somewhat old HW.

Maybe don't bother with newer kernels for now, but simply checkout
d0b619599e52 and also add this patch. Recompilation should be fast.
Then run it to failure and post the log. You may want to run
'dmesg -W | tee logfile.txt' just in case, because the resulting flood
may overwrite initial messages in the kernel log buffer and I'm not
sure how much extra buffering journald maintains.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 24fde00fbb3f..57b326d9c99c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2779,8 +2786,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		ep->skip = true;
 		xhci_dbg(xhci,
-			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
-			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
+			 "Miss service interval error for slot %u ep %u ep_trb_dma %llx, set skip flag\n",
+			 slot_id, ep_index, ep_trb_dma);
 		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
