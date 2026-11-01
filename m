Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793524348;
	b=WIdjFFhegHl+aPLdoOe6sYGW21q+RZypbCf35rW30Un96X8+xSZgEmhLaBWMjOUQJYrh
	 SCWWSeD7NbigppEZpY9EzmM0w+Udbhc02pW4Z+e1lNVIONF1eiYIHz8Ysmu7eYyLl8pfu
	 PMXvxPaeoS4EgNABwL2DRWaKMs6RMmOOky3E6B4Ueu3OBSecHTHwOmAGaC09iS6WYU4mA
	 YgdcUZj+2+qNdA0tAp5ri+SJQ4sYWkjJp2z189b2DtpD/mDMC5jPt3fF/A+YUuECFuCAk
	 VcgE16jRLJOXU+sXIB+pqE+eFwYYh/+nqMI7f/gFWttVSXEkJ7OCkFZUFJFoX6/v5jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793524348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3ysPIyTHoA/9Jg4MEjHSr/SQZx/nE08X6Q8EzC88lqo=;
	b=zGoHSKmqYyO8fyDr6PTwfa/Gf63O2fuspj8jgr3RKMl/jhs9TKfproezPI2JijYv/1UZ
	 9hqTVQ0d40/oCBycZCTIx4BoZWRYBoXtVDGuvswPopUM33IlYpbDhJUB3vC9ggSsLoOY9
	 HG2BMeG/eog63no+XcnTkCXm80zXZ6RH4WZ543Gt4byPxEljtx9NK+ar3SEESVUTopXIn
	 +Ib0KOppISmOrl0qMNKqlj+31oGsQAMlbwP+4g4BEmGR5rJp0rAZvPUTbw8XlrAPi6cGH
	 aK+fprwcfMRnG24IhLfQr9EYHliASw04npCeyF5aFiupQkWE/S2dsdvYf8g2QrYUDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puwyvf3q;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C54D606A325
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 09:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C54D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puwyvf3q
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso2941712eec.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 01:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793524347; x=1794129147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ysPIyTHoA/9Jg4MEjHSr/SQZx/nE08X6Q8EzC88lqo=;
        b=puwyvf3qlFZ5aOotS6Fv74jcQIT5BCHjlUVjgKKARno+rxWB9U4MIbPywKVmbOy5ib
         MPcMbRF2foR/UqCcX3VN+CIR4q6fCNXEx8Qu7LCPu864hBm2fT7JlZWFBKLUjn9VW3p9
         OEfKu78cHecd6Fbo9xvEgqmsasteThfGAI9TwqVfmMTlw8cExiD5RCU8jNlIcEvmhZ/C
         qn+9Dk4+70eNz1u2x5qZ26FcTd1OKNWXDK7QV23p00ZwkCB2NewG+vxVTFLU0TNSw8Ai
         zGMFPKZ7ndIknLst9kZ1Ojy8c6pt/SypNNb5C8at0XmDKtG5jd9j2FWWc0zsIZw1IxeT
         vILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793524347; x=1794129147;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ysPIyTHoA/9Jg4MEjHSr/SQZx/nE08X6Q8EzC88lqo=;
        b=Zb+TTbUBAsyrbEw5sjGliRY5WEaxKmSquUs5Lao9QpUNyidlTI6RQU2uvUGJCt01SD
         GRTz8CDiyb7LCpA5wbghGHvtQa0P4mUbNzpZ4SGr7nnNK/Q3Udp+z7OvaLqMvfUTqgxF
         rtcMo6/8GWpeK+qYOl7T6MvCyMguy2zuyQcNELpphr4gKunkLLY/SbkC+Rs3a7HWVcCt
         09y0Ef+OZhKjPfME9KXV412nkYUVPpnuXNApig305Yrl2lTy4ee3DrnAg1dsYzMBzoAl
         6pnCKCQms/FYNHNk2RTJ4UwLggnkcCNOHq+MOD2o/jZyv2qltUWYvMdWDDI/4+t9UvtC
         V+EQ==
X-Gm-Message-State: APuU4Z+v0zW5lBkC6/bIhyjp98sGL+I+scvNTpAAuJQo3824ZC9LD8++
	J10BbGAdj4eW6spWUFFYvYvmKbffyz0URijw4tU+FxumkyISTRu8RWNZ
X-Gm-Gg: AYBFou0+kF43Df6jMiGQaDuU7X4Cgt95G58aCbV4oy1Fi8ZR+VLESPMVmkBFFMkY+E7
	/0IU4MIrDK4BygX1VL4M2diCw0ZDPD1RCE/Bodpe/HO6ejGDXdkgfznX8OTMHe/cCvts5CMkpL8
	C4ETBK5YqI2ZZq06d/bOxYh8XcygDBH13rahW90yxBxNRgV8dLtA8XNg02fArxqDV8DJTooLGNJ
	+xqkXYucQ9rEn+VbTWTLCMc/fV/Hf1B6+HrzgZlCtbMDKQrTv5OC1q4KJ1tZMj9TPpw6QSrCdTJ
	V0V9MxFLbN1ZGpm/YCdwwUMlmOa5mPc2wNsph9Wi7JPcZwtfapB5XTh1WwNACl/W+T2n7oGPn6Q
	OwpqlVBSijaF0Vn4dnDWmjf6Rc+zn4cKOUxBPKs8tJ/rbVUsiErpcmkjKqmsBZxEyMKDxUxSJmE
	YcrhrTgGX8SAMdGkJ8WwWtMvB1HBbWxU6vRkoMXNHOnDtqkCl8X2CNC1wl2v1wQ47aNWoYTPmRs
	H/6XY0jYxXlVvn48box18oAjkn8VNU+lj3ZR5kCYYZ8Bcp4E7BTIjdNdJ/Rq278FFUA+8A68IZc
	bqBVIiwncuuZfb3rOO9qVgbfBFtbMkOHiK1mI8ie1a4SpOcG9gtjGaqrzw9vjqVjLekh
X-Received: by 2002:a05:7300:cb0b:b0:354:1db3:674e with SMTP id 5a478bee46e88-36a42330b9fmr13797488eec.6.1793524346880;
        Sun, 01 Nov 2026 01:12:26 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm27037797eec.3.2026.11.01.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:12:26 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Subject: Re: [PATCH v2] usb: usbfs: clamp actual_length to transfer_buffer_length
Date: Sun,  1 Nov 2026 01:09:46 -0800
Message-Id: <20261101090946.1963739-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026110138-kettle-daredevil-ceb5@gregkh>
References: <20261101070651.1846947-1-teel4res@gmail.com> <2026110138-kettle-daredevil-ceb5@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

Agreed, that is where the bug is, so please drop this patch.

That was in fact the first fix: patch 1/2 of my original series cleared
actual_length in vhci when usbip_recv_xbuff() fails:

https://lore.kernel.org/linux-usb/179328314074.648427.388274461758949120@gmail.com/

I withdrew it only because Sung Byeongchan had posted the same one-liner
three weeks earlier:

https://lore.kernel.org/linux-usb/20261009122636.642575-1-tjdqudcks0424@naver.com/

That patch has been waiting since, with an open question from Shuah.
Its review had also already pointed out the case it misses: a returned
length with the top bit set is read into an int in usbip_recv_xbuff(),
takes the size <= 0 early return, and the URB is given back with that
length anyway:

https://lore.kernel.org/linux-usb/sashiko-outbox-165560@kernel.org/

Rejecting any actual_length larger than transfer_buffer_length in
vhci_recv_ret_submit() covers both. I can send that, or Sung can fold
it into his patch, whichever you and Shuah prefer.

Thanks,
Cheng Yongkang
