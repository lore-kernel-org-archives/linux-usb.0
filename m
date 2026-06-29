Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D73D75AB
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718122; cv=none; b=ExsEnN2OjY7/jYpu+bhxYUKvLg1Ex0KW+mwwlmR4ztMud4jgPnLOBFD9ZpzfNyMZR9ObhSu1272BsvPlqO2+CQX3TJBQRzNVsPBUeEwRY/UUL+EkkIFXHRSs6UCm5e1/GYtzjzzSICAkihYWSgpUZLWAM2Si0nFHhYfi5HAuePw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718122; c=relaxed/simple;
	bh=lQpHZi11cKsP2uCr/CzXPM2KCFMIncW7KSkiCY3Sf8o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qVP2DDHGc4oJUPy67DttrvpWxQmHQ/CE0iJdRdA4tL2S+O7oQI+HfBzzfYc2w+0WxBiJhSCfjK+1vuK0xOLK5PEJqHjIjKwBtvQb/D7/8R2b7aybqqyGakHzMkKmQdL+ZPyCagc84cTRYXnWXAtLMmXcElwBbw6bQ3SwW8Ensls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrOxzvN/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrOxzvN/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629051c946so1568737f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 00:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782718117; x=1783322917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQpHZi11cKsP2uCr/CzXPM2KCFMIncW7KSkiCY3Sf8o=;
        b=UrOxzvN/VLZyexkM42OPh/9OB+oBzCCqGQnoAOCIPya+wOdsU0frbhCb2fR7dUu7T+
         IlnRyU7B8j4zKGbfdKVaHuQxRGxpsx6/YtqSkvLFEsnai3kZuY1cWl9NDpckegzAqfQ4
         Ao3bcEPd1zl29neZKxRM6iionnN0nE/ZYbQKSOEu5UhwFBFYacqYtiQ3hlVIBHkZ+eBR
         Q8EFYPW7bgSTvEo65YBJ2j6JBqQsa+IruDkro40c/fidgxZljjdRzB7MKKETNBcGo7ZY
         lLvXj0kTHJFjcbGUu/XXAEAJgKp4p8Wo3NUv5kBwSygAVWDbkl1ZJgOrAjNfKYzn2+YA
         XYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718117; x=1783322917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lQpHZi11cKsP2uCr/CzXPM2KCFMIncW7KSkiCY3Sf8o=;
        b=c02oDnhXDpuyoiLKDozXobK2dmEoP2FAVui401uMaA5AGihc6kgbBYAabLpbzl+nDe
         GPujIBptlTywJK52kiUSqggmBmG7ncgecJmqWy/J7TzCQlT5E2gwnBl3Ab+EngRTsX2L
         9Jb0Jcpj4deE2pTvy+bm6bKljCUBajoIlXF87EHeFDnSWJFIhF68KEwR9AWl673j3n2L
         TIYN7vFmRasQngWGmlCksZt746HmwGilwqSf5orVhYbX0iPzBmUfDzL9gzlDhh6JiuxA
         Qjy7CB8HMPuV9hKCRFPX3jYYwweUcplp3Gmy0jDXtcy7U8wLsba6W+ETbcZ7alYiOr+y
         +ubQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWyTZKmfoQkBhig9ET5QfE+tpf2N/zQs0GQcZn6ryPe9r9RXIlIbB+4RaWW6YyWYj864GwPkAKeRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRajG3nW5scVmS6bfy+wEg3h5cwFVkhJN4dMpF84/6D6aGhMG4
	zefAUP5X9veeMRzz5PB6Fgs7TaznxS7l0mb3o48xBIvPH6RVjrUKE5+X
X-Gm-Gg: AfdE7cl01XEgqz5EygYpHJrj/pNueGSLSz+d/BkGqUVUmROguNrIWR/b0Q6NYW+trX3
	NDT8qCimMR1c1fkXXvZDiAza8OXOP0eM2KNJQ1EQQRJgXvvrgT208gnRdzDVarILYCyc4wMPfKr
	B0kC1gdD4c5SQ8yM4OPKG9nezMDvDQCx+SsG0yaePAV9zWf6VS6c6oHPdoAFZl6M7CS4QE+yPkl
	iruID305lQqB/TRCnZTXn3rxVB7Qh1DWZpA5f2wdDt0ZJqsThtMRKHJEBld757/sjk7+UmKmTrJ
	HHtTDIIyxQ7Q5SwhSNf7wX2vNyVnsiObOIDg4ciwGtueRicI2xBi2Zc/weEu4R+IxpXOtR7suYk
	VijU0pgFgGk7dnwndc59rAK2Cqx3VZBl5xiShcqWT7qjdD2kAFlTxBZvBKNclmSrWvpbk5/tkWf
	t9lFrG9jSTWH30bFV941WZTPYB
X-Received: by 2002:a05:6000:3110:b0:46f:1b89:999 with SMTP id ffacd0b85a97d-46f1b890a94mr16268450f8f.30.1782718116866;
        Mon, 29 Jun 2026 00:28:36 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm40122019f8f.4.2026.06.29.00.28.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jun 2026 00:28:36 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:28:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: sanan.hasanou@gmail.com, vbabka@suse.cz, akpm@linux-foundation.org,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
 harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com, contact@pgazz.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Dinghao Liu
 <dinghao.liu@zju.edu.cn>
Subject: Re: WARNING in usb_free_urb
Message-ID: <20260629092832.355327e7.michal.pecio@gmail.com>
In-Reply-To: <20260629092033.4a83e91b.michal.pecio@gmail.com>
References: <6a3eeead.7fb353d3.354599.b0b0@mx.google.com>
	<85cf5045-b52b-4aaa-a038-ca1b856b55f9@kernel.org>
	<20260629092033.4a83e91b.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 09:20:33 +0200, Michal Pecio wrote:
> The free(buf[i]) loop should simply be removed. It was mistakenly
> added by d571b592c6206, then a26efd1961a18 recognized the double free
> but attempted to fix it only by changing the order of freeing. Sent
> from .edu domain, so probably an automatic static analyzer fix...

Correction: it failed to recognize the double free, but it fixed a
different (real) problem that the buf array itself was already NULL
and couldn't be scanned for buffer pointers to free.

So it turned this NULL dereferenc into a double free.
