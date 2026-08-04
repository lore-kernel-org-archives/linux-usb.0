Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C226CE2C
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837680; cv=none; b=c3LNcS1gnYNIwUevrvl7kYqYEU3hNPgsle1wavFU/0K2JJXCD+qCldRYqA+T8rMWS6Y9aGOwCnO+xL+vjs8xr4zm400yFgJf4k8xoUQfdmOGExf/y1YI/e6O0raOCEJt81N1untmt+dE9MOVUzzdwY9QI6yOU50SVZlKADndEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837680; c=relaxed/simple;
	bh=bf9E1OT/5MsAiXVjLqoVX53ARQezQ/P1MffsZjiEV+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=awXFcP9/fGntNQi1hOzDUe0WKBQS5fyEQuCDcQVDd3zwWExDvCexanmygkOKGKTM7UBhaWyXYPKjBjh0pgddJimtlEUYzBiiUtPuBHlle6koPMI+6el+yNusAqtlNVgfGRbCs3MhBD8VmPGWeGdGrkyg8xPf8k56YrETetV93TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZQ4+zw1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZQ4+zw1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-496b7622a83so20313145e9.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837677; x=1786442477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZR9jSlKe7g6Silg9pcPprlK6JN19RsyTKeQ3eWYjJc=;
        b=QZQ4+zw1nD+9btmlkPVCq0ZWURG/8adjJbYRJJfGd7WFv92DuzSnVd5bPMRql+AcAw
         QiPehb3yNxhpvm6BpBrpML2ZrpC/O1+q1MbEpqVrvexyst0KzbHuwQli4euxyUhZR44r
         +TsMLHybcPq20I7MJjslzXsMd2IYqMxNfPxuFfHl4Hb77wmcTc+Xmurx89Wejgr6HNFA
         Shn+uXFbN8TdCKIOXLtuKEJR9I0XcQB4H0LBCoOK2+8fTbwaL2l+5xiH/s1JiPY0k3fW
         GvPf9l9pn2QEkXGGPIhKGeyEnYJYQkjym1dz07SMaOIbZPjaxPvFTDAbl7Rf3AXUtWQP
         Bfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837677; x=1786442477;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yZR9jSlKe7g6Silg9pcPprlK6JN19RsyTKeQ3eWYjJc=;
        b=mbcSecvaO3XDorAuhnwzIWXclyEhMpfU5VycLNuKJN/8weeycNCn151v5QTlFnLIAr
         iHbsTOv5ALGa+5wn5FURmzjICTJKXvtoUo//y+icLItHg2vQq7ab4bnwVUpRSsERgFzM
         Xn6d3kOm0B63IEvbS+crCCdk+7vwmea+4a96678prELryzXfFvp40ysgvCVs2BDgzrsX
         xPMGk+Sxcv4uR71kYYcxXThxHVoO1hkLTVEcA3Eu1nsMRUihqYvc72y2QAVbHnMrCaSs
         k4CajdE+2W3u3uvpDxechB+bI9LxXj3kFdRoUbxOWtVhANIUjbnBfh+J8Qm7eMNSofil
         gGQA==
X-Forwarded-Encrypted: i=1; AHgh+RohwkjnQEtWwzQT5IBo/RN8w/cy0/lOeom0077m7Jig/FGes2tIpYaVi1EWgoKF37qOOiOVHCHjhi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnIxCdJcvTAkktTlhpXMRIj+PVyLGgOJtkqev4hf1fqKSBuZpx
	PNXfpnFJD+BwCFNpMJLQy3/020HRYgP4ECjbOVM5qgIKCCPLkwceyhdE
X-Gm-Gg: AR+sD130jIQM8yJH/fi2Tsp0K5DkmA2aKQN0ZwsFxIPqWzZp5rnP4lHIRgK+aNrPO6i
	6n4ec777yTeQkI1U9P2po2juQvmKzNWcBXK0jk16aPeMKI2euWYK2WqOXlTIi6qSpIKWuyldaOU
	b3hxngFOHFCm0f008tNf7qD6VLcB2Cfu/Eqg5VhhirJetAe0zyotdny4mCl3QngDnj8mlUVc8ks
	vD+Eiv9ndE4G/ZxTwAXLHqtYf7VFuvCqNSVBElmFb8s2Lo+SH0P00IrD2IHR2K0bVvd5t/1Jva3
	fpAqPAANSvNJ/0dFT6MQRQMoe589AVFjsHAyStAyKLztz12pKzx7C/lQX9LMrvTpTM86v/lp5FD
	UAPvR31XuDPiK7NfPsl9e3GHK5NWqKacw5O5XLdW476wwZ5+pBu1ljod4ZJNGJjXcLXoLKxLGJx
	PoGcuobI5FeO/Kwm5dGKd4AObXtSgf8/trS+IQTWO3nztVtOwYfa1PDshLpRp/wX1ItlJbk1fI
X-Received: by 2002:a05:600c:698e:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-49949f377d2mr95203705e9.3.1785837676750;
        Tue, 04 Aug 2026 03:01:16 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm228697455e9.4.2026.08.04.03.01.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 03:01:16 -0700 (PDT)
Date: Tue, 4 Aug 2026 12:01:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] xhci: Sort out the TD skipping business
Message-ID: <20260804120110.01bda0e2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This series is motivated by a recently found rare regression due to
my commit from last year and the solution suggested by Mathias Nyman.

https://lore.kernel.org/linux-usb/al_hchyOdPoPWKEo@spiral/

I think it's a good solution not only for this specific case, but also
in general, because the next event after Missed Service Error almost
always references some TD - exceptions are Ring Underrun, which we
have special handling for, and Stopped - Length Invalid, which would
be a rare occurrence, not currently supported anyway, and possible
to support within the proposed framework by making find_td_by_dma()
calculate accurate 'missed_tds' value while still returning NULL.

The first two patches fix bugs, because I found another obscure one.
The next two patches prepare for the last one by simplifying things.

The last patch implements the big change, the whole matching/skipping
loop is replaced with a more straightforward and robust version. New
functionality is paid for with a net increase of 4 LOC, not too bad.

I gave this a bit of testing and it seems to be working, including
weird cases like: Missed Service Error retires a waiting TD with
error_mid_td, then skipping is triggered by another Transaction Error
immediately afterwards, and it turns out that two TDs were missed.

[ 1665.224921] xhci_hcd 0000:0a:00.0: Transfer error for slot 1 ep 2 on endpoint
[ 1665.225151] xhci_hcd 0000:0a:00.0: Missed Service Error for slot 1 ep 2, skip 1, try now 0
[ 1665.225156] xhci_hcd 0000:0a:00.0: Missing TD completion event after mid TD error
[ 1665.225305] xhci_hcd 0000:0a:00.0: Transfer error for slot 1 ep 2 on endpoint
[ 1665.225308] xhci_hcd 0000:0a:00.0: Skipped 2 TDs on slot 1 ep 2 comp_code 4, TD found 1, skip flag 0

Additional testing of patch 1 in isolation would be appreciated from
the reporter of the regression (Cc). That patch would go to v6.18.

Regards,
Michal

Michal Pecio (5):
  usb: xhci: Handle bogus TRB pointers in Missed Service Error events
  usb: xhci: Guarantee URB giveback on Ring Underrun/Overrun
  usb: xhci: Don't set the skip flag on non-isoc endpoints
  usb: xhci: Shorten the TD skipping loop
  usb: xhci: Rework and improve the TD matching and skipping logic

 drivers/usb/host/xhci-ring.c | 200 ++++++++++++++++++-----------------
 1 file changed, 102 insertions(+), 98 deletions(-)

-- 
2.48.1
