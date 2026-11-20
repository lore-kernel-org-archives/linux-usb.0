Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186903;
	b=P4VW9ulAdmib/C8WGEWPGqhsQ+4TJsxT8q/dbpTdTmdg7lGFJ8R2cUkCpRmUahERXEjr
	 9duZoGRF25U7fAiRDg1lunyx4xJ5aVynq0+veIN2sw0032rcngj9JrLmY44UnfhnAgPqX
	 uz7/4GCuw5/7kdqm/Tx2ELLYwTupTI6jXxHLRkYA/+M20sF4hFortGgStehic8stgbrgO
	 qd5NFT8DyhH41dtcNcb74H1TD7UbZmQZj2oO6pTViJmdQBUZI9LG0/i/5/0T4HnmHZJNI
	 tkR4p1SPIgpPzFWwiD6kA7JGAHdB0AEWEGt2fwVgh+tB7PQ2eSCnz00dj27HulNPDOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=aUKl5uun6K1IYcbSDOkhJjIoRsG1dFhoyOQzbur6oQs=;
	b=GuyTPth+0ZbEh6z6+nrVVp1fRWt5c+tYNcz6e999bLlxjHqG66qesP5Bc8f/4Xifj4sm
	 wQBPJxS7svExJTeenEVw2+9i2FyHQO3WmIu5aNWSmiN3aowyptmWKWkSpvsfmC0ba41Dz
	 YxtgKlGYDVfqAtGv0YF7y0dIj2qyjwp0g8R6Vz7mAwftgohBgcf/kcv5pCJmlo2XF29QG
	 FS1dUHFljzNh+QaOXmSuSG2PnCFbgPTpuSvDmI0pNj51GqKPN5abNIySl331kZdlG6qAz
	 D/Bw2DMWp6zFzHmCqThfH95DF+2OTsalnz3592ONjFcmSamE/VH2j75t4phLxknzkvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oDjDQUlr;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88BC606A82E
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A88BC606A82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oDjDQUlr
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso506112a12.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186902; x=1795791702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aUKl5uun6K1IYcbSDOkhJjIoRsG1dFhoyOQzbur6oQs=;
        b=oDjDQUlrOmSFk2QDYknfQKEG5sCRn84GhjqrmRVYHdQYciNvWi4ANxGrRHRrd1ccV9
         /5SRc+jOgTmuV/gZ7/C5q7CNmRo20O55SOifHQHSV0e2djtryOwvGKHRTy+Cu2dBndSb
         823hZSA+we8AsSY2468ITes+IM4kbp6RwHQkRoUbs/6ToXlSuSRwrrRPl/yiVT+3wV6A
         gXbonlmLCARF0yDx24XMT9Pv7Nc9AaWqhmVhefm2ngK88uPA357e/XzHLTDjSnysNd6v
         2MVManmYPHlrUtGo+gIBDe31vGpYcR4L/sS39mqRUGTqOlVSaUaExZLAzdCb2zTr3/HL
         v4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186902; x=1795791702;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUKl5uun6K1IYcbSDOkhJjIoRsG1dFhoyOQzbur6oQs=;
        b=OAJPTxxqS36zK8uloGLKJBcA/u/zrkDNdTPs0fe+WNsHkUoXBdw14w+/4o+Mg799QM
         +d+vnp3mprdyR7c32CR8sKUDNMv4pbo4ggRQpyYY1i6YKM3Jp0m1yl84tIAZeQmfIaor
         fYD3xBh7G7FMZiQMtrcU8TlPlBDfUjq56e1o5npQC1suYmOYWgmOsws2fB17picrwSPu
         4afatBHWfccYgGZDNh8Pfh4WHq0ctxMLrDkZu/TmAY0S0/ysi7h0oRFPQknx5PwnsLhq
         IZVtU2y6b4OdwFCwYhxMKQtiJ2Khl8RzM71xzw27Nrvckax/dFvdNp6zLA/prc/R9sf2
         7RrQ==
X-Gm-Message-State: APuU4Z8ngzuZ4xKh4ou3pZFD3brGzajv6locPboUeb3wW8yqWzZMyHWg
	MLG/YkS6LfgcdJ0MggPgbjZEp9PBwIvfDiYb2tKbZayIAY8llEa0QCHYYAlVp3QWPC0=
X-Gm-Gg: AZFdTZd3x/YCMgfOygSrJdhk+b+lSQasJWIoZPgCIjqPdPVsbGGh8Eru4tYqhDaQnM7
	gJyP3bFG9edNiG8i5XxDtudttlsEmPbY4D93Y8jNerMZSQChkJUw8yhtbIEEHdJem8jyzfEvGEF
	i5H0Yff99umSPj3wrMtT/NqsN21mqYY/Vyt9DgzpP1xFMsYEyxwB5snwXfE9XaZAc/XQIJSCG29
	y/iuS0+kXphJUDgcEwFT/Ko+P+3SsGMgZNs8+Yq6aIc3wjhddy0j8voffT5S0GeXFbRfkHjRzIJ
	JFqX2y/dW+cFywtiaNtincwzPKaFzy4iusWcD/b2+1gSW0Z3rj6GsoI/8Qdb+NB8lYjyIBYElvl
	Rtc8iothoocW8yYuEGQR3/rM63ojgPVfhpt/0UJVIRJt2AZ7THENH7PuizzCI9Ge0V+teBs274m
	h+EYyeYNhV62a4mxFCeqiJVo+H6KX2keAUWMvzlBnRCUMXVu8Hu+fx3Mzngulhzg0wd+5ivIoaF
	QNQPiL9fWA3s9fh8ZKMztXRSowWAtGB10pGPRwtFdJSU5EfPfLohurZN6rOrNPJbGVbkBjqOs8d
	oal06hQMQbW8K1zALOb3YYMMFF2ZzsWeVnj6bZB9qKM7K4uHiUdZsqMr0sMQVSphXtg9d4jh6S+
	SSIoIfWIhr0Om4gxopC+MMwX1wxdjQjOKbgrU
X-Received: by 2002:a17:90a:e70c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b41c7bc5a5mr2410758a91.3.1795186902056;
        Fri, 20 Nov 2026 07:01:42 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm4720383a91.6.2026.11.20.07.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:41 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Sat, 21 Nov 2026 00:01:37 +0900
Message-ID: <20261120150137.3128398-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
References: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Oct 13, 2026 at 09:58:54AM +0900, Yehyeong Lee wrote:
> usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
> the OUT request completes successfully, looking only at req->status and
> never at req->actual.  A host that declares an 8192-byte WRITE but ends the
> data-out after 4096 bytes still reaches target_execute_cmd() with the full
> length.

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
