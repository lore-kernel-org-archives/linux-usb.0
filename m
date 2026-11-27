Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773735;
	b=Zvmb1dZnPq7IWtq31USHL8vYGH283nbwPpwA+4q04aim4ZtCgwfJVTO7AKeupC5BwyK8
	 63E/Ix+H5wxR5gg0QnvMKpUdDk/JlisLwMYdMG5XS7IADWmF7xZUB+WvdA7VhuMptzygf
	 W4qDtc8IpB8i9Mgq8xGxkN7ywYYYbxabBkA1A0Q71Xedz1h0kbPxiwjkZdnhnN/rMXan9
	 emZykIcG+s54x5uY7u9DOeIidE9WGHS6QSqLwguNhJ9p8H95313KQhNFXTEXnIEhbmdkm
	 IVygfb6dIX9fkAI+UEznmqb7LnCX91XbgalUn8E0RFHsG77/jFaffcgieShLIBmD7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ak9eqmY1Ln0Y6jdk2Wk2nFh2b0XNH1fDqNSGEcSqR98=;
	b=W3iWfvejLcwf/pxJNIIT3pd2b14UXt++mLFWLheDiJbn5JWtViBTOO9w0ElBm/VSrmda
	 Pjwqy/Qp3P/xGLtHtPG6vwiNPTDzeRWavyaoiaX3CzTxLfg/WUjFUGgG/HWYhg0RCqhNs
	 6Th820gYCsDm3kzkBsL59VtdGIrd2vi/cBXwxDbXXBkYkhmEKQekBSAjixa6i2o83wyx8
	 CGxoGy+oSYPFsId178xPUyY7Drg6ARxK6nHpVpot5gVT41AZU8TR2GWNxUrVjl/p/R8ZZ
	 KOellLODHqLgsdM3Y9Dx8krlvEusrChjwB1/u/KR+lxnMCrN1tygFbkFC5/h1XyN/SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gBa2fzrm;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01D9606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01D9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gBa2fzrm
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso10459327a12.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 02:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773733; x=1796378533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ak9eqmY1Ln0Y6jdk2Wk2nFh2b0XNH1fDqNSGEcSqR98=;
        b=gBa2fzrmuKv9q+IYId8o4DIWpz7GYyg1ToUCA7rNLu4VpgbR81U3a/yWJnOmt4dqxZ
         0BpAP9ODagQK53u8DmrJihUT7q4Q/+bjL5h5lJ42aDoBbPKV08f/mHTHldDo5ASBz+Xp
         IfSOt0YDtrru1sCUwO4agpZM67WjJF4XW2v2Z+3zjFQGJ4LeR+zQ/t9S/dEe6CYFGJYM
         ozoiuqN+6UG34Dz2ZQLdfjiyyBSemMTg92FOszy8xvBJx1+q4VsKV0bJiYbTscoYxyVi
         jbwRGalJN9awo5IysTEB/SC0ja+9VaoM96xDtFIYcL7YSc80NSD8gwYuD6TNrX2QCes5
         HK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773733; x=1796378533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ak9eqmY1Ln0Y6jdk2Wk2nFh2b0XNH1fDqNSGEcSqR98=;
        b=Pg8q3lQ8HF+9kDqaCBAiaGRsaOsJFEq+7s7JZ/RCYLBz675FcFm8VjgE66bS8xCHU9
         RoIPlRGgiWRsRpOiU+5DP7fpaYRiFFrkabQ1435vgKrfomi5/mzfLjsOu3TmFajgZnuB
         xVpDjkrXSmRn1pO1yOQZ6y7B9TmBfxmnUMJMrs8xYI3JWJLQFW/0MuAHYgemd6nW3QE1
         4eaoTIvW3cbrIOwrn2VuJ0CZ7kJ98FcWjCKszh07kxIK3ZtgK4cqvtghv1l9fHFKsKCR
         PYSiXZjAeuvqX6/AhUaGDJYumINMKuEGlxXYjwC8OVsbc9DVKJBC0EkIZjqpf+YQfAwy
         MGwQ==
X-Gm-Message-State: APuU4Z/eMQGUCAxhbjbkSPyUa7OiZ/PlxtRBN9yzKR0cyT59GokQBvYB
	qj2wwLZJLQBP+kl/rqFgXG/euU6QtCUKmJ0v7URRO7L8Hv+RpmOMz4n3sTgRoA==
X-Gm-Gg: AZFdTZdp5gnthtELy0N8gkRJ26DHbX9jIft8Zyu9pypgWZuKFRwJx/M7Buau4DIJw8g
	aa7MBKvGA7XvgYVpX9wleJJ4TACxbuJA+Nt+tAluuDsdjd7w9ht2QlgD0DK+rolRNC6/6KsSlCm
	4SHuQS3/G/WSfNIDMna42UBTSWTdJaQ0AnO+PDB17Gcss+oeOq6uG0aXbVpCurFZVlvLmXLzeUu
	wBPjGe/sxUl0EdIAJ6tPNSTfP3LH6xSuOSVZFAXvVHoOknNgNcQureki9AI7Rsxo5BLthzo3p+h
	NBss2xc6QtNbJB6UenBzRdUKJ+udY76SN9UkZeZHQZ+B0+fHJJrOtd39uXQ7E6BjIRmrhmcLX/E
	QSfIvs9QjO1yTCjOmlWIU0B683A/xCxLQzLLwGzWRB2fKqaNigeFvq7gUnfFOTgagk4BVv30GG8
	DM0dljgbj9bDWG6YtyE4EWk+KcFOv7CKJLxvHrIuSGVY/8uehZm3ANuTZg//ls6mwhGCc3BUZsD
	09pfTDFmRKAFpde9O3McPw+GTkmtizTc6cxgDcCSPVA/Y2LQ6zqbJVa5peS9/u9yddwjfvRQ9jx
	sVynfs9bmSRe4zRqlozYx0LUoMlq0byPYB48dLmLeE2bcd9I89ntsj2588s=
X-Received: by 2002:a05:6402:13c8:b0:6b6:f5b0:889a with SMTP id 4fb4d7f45d1cf-6ba37eb8461mr19411638a12.35.1795773733103;
        Fri, 27 Nov 2026 02:02:13 -0800 (PST)
Received: from foxbook (bfj60.neoplus.adsl.tpnet.pl. [83.28.47.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm43268467f8f.18.2026.11.27.02.02.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 27 Nov 2026 02:02:12 -0800 (PST)
Date: Fri, 27 Nov 2026 11:02:16 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Demote isoch buffer overrun message to debug
 level
Message-ID: <20261127110216.16d4db3b.michal.pecio@gmail.com>
In-Reply-To: <d34713e3-edf0-4e37-bfaf-73ad6e286c32@linux.intel.com>
References: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
	<sashiko-outbox-229825@kernel.org>
	<d34713e3-edf0-4e37-bfaf-73ad6e286c32@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 19:59:41 +0200, Mathias Nyman wrote:
> On 11/23/26 20:31, sashiko-bot@kernel.org wrote:
> > [Severity: Critical]
> > This problem wasn't introduced by this patch, but can handle_tx_event()
> > pass a freed td pointer to xhci_handle_halted_endpoint() [1]?  
> 
> Adding the patch, and writing a separate fix for this sashiko reported issue.

Hi Mathias,

Severity is vastly overstated. For xhci_halted_host_endpoint() to
return true, we need either a Babble/Transaction/Split Error on an
endpoint whose output context indicates non-isochronous (while being
isochronous and using error_mid_td), or Stall Error on isochronous.
Either case is a severe hardware bug.

Simultaneously, we need another HW bug which generates such events
on an empty ring, or a SW bug which gives back TDs before execution.
I think these cases of unlinking from a still-running endpoint have
mostly been eliminated by now and we don't need to worry about events
on empty rings very much anymore.

That being said, clearing 'td' after error mid TD handling or using
a different temporary variable there would make the code more robust
against potential "oopsies" of this sort, so that makes sense.

Regards,
Michal
