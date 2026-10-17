Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA513BF672
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 03:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206629; cv=none; b=CX4DrqJjIWeEroGnJDkkyrPfTESqrtt5mIAdZqi3wXNaMeqhkviV61aKgds+d0WPw7RfDvuSMGCHIjkC9ixesglnplEvjE1hz++LHbNyaOLQuEPpHaw9NUOsOags/MNtGACmcdmpFBnhzT+khKCUPt1lPBuk4lAhQ3iP8/hwFak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206629; c=relaxed/simple;
	bh=/zrStHSnrdBLteYWkJki6mlZWav737dTxgFd6gq+aJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIy7U0VJCPRatf65oL1YbGa70CVtWSq+zHNBsFcA2/ju7Wuru4wwJaepGAnEO6P38w9Bk2jAvTDNhhzxZtA6ZepkLRy5jocKxsCl0cVTI1OlKXvEseNHWOTQs9vTGwZMpAS6qH2Mj26hdVtK74PcSKtkv7HHCBvkaC6Be6zz6oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLfjXpBy; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLfjXpBy"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so1032368eec.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 20:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206626; x=1792811426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zrStHSnrdBLteYWkJki6mlZWav737dTxgFd6gq+aJc=;
        b=NLfjXpBy0IXo2vWMYhCnPFiJVxQrpS9k+qstCXzv9E1xE9ePo4m5INCzQheq0JG0tE
         VHlhU0WAAzp6VMTk8fw4C9eiyGs22mbog39EFoTzB+EIY+79ia9qU6GRW8wBRlPEs9Tl
         GHA/ravoAILMf6D7EY6TVndnxm8RZ9L2UDlZ1ec7vd0PsTkjapWdvApuql1Rfvv23NLv
         mYZ/eHp6BvXcRVF53y2mLPhnXAllfyiD8QMEEkR/0zJ/oN4xy5fW8kRNLMGoAfmuD09Y
         Q+631AvqKtB/Epjt5NEU4xGsC04GumQ9cCKyoyTUXHF36fSaYvDJuzuI7XJvpXqfKQHs
         G4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206626; x=1792811426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zrStHSnrdBLteYWkJki6mlZWav737dTxgFd6gq+aJc=;
        b=KkNcA1QKWcm5GyRZVK5fgMzlnlxZ1eLzFT5Xmo3jTQgqKU35MY1bJd+ji3bpJTj80y
         ITNFi2xBkxLRYQtLmFZgwiaKlSB7GRdyf3me4ixlSjXbHec2VxKpLqRMCl3Xdaxd7d8s
         nzwLlX19kkVUZZWGhqq++Wjxe2piAuxHfcHhww+U48YgJAF9686ht83ckEc8DlRg0mh7
         3Qb/1tkHmRdiFwz22DwzlgX5cnGS5crdy7LYkWiVseLndJ9M836BO1M9pOewJesc8/un
         vS/4ZgQlXrPqcXS39MDGOux4HMtgrJqJWIt0z1NqDdvxJ+k4NI2xVu9P+RVnVTujgUnj
         EjdQ==
X-Forwarded-Encrypted: i=1; AKwUvByNNSGgTeb40pXu6LnNImfM09tZfBxOLDD2ihazwBYf7aMlHsjHpc4BSYvBbR8CrbYk7D0VND0Ul6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBcG3sUNUniEAQcIQJXOMT5yRQPdT4zYE8PaJkr7PKJiyYUkEi
	YQUACdAN85tIcOnFCrQ32gIItVnZSCRXt2qnRE83YEiZEcU8s++2LYv4v4CaZy4W
X-Gm-Gg: AYBFou2rTwInsYnKddEB+rSU0uvetUlK7eHKp/JbhK2Q85U7ouUyTKWTQ1KrxEi7Ow8
	JWeAfkmuX//8VqD8rrz2HHCdQ582LdfhqQ/7gLtrp1BgKtqvMIxjKiTCPM6CdBs7XTydjoDvB6p
	jFo6yDWrAWT9iVRdae8tMUTmM/IAA8tO0me4+S3ygfCdqdLUmt2Qmuak7hyARSKfcXBWFmA58fw
	r+weKFdTQegISb4Vie6rN8mBgzDR2LwI6U4gp56ANSpa3zKyP70Oa+oDE7U0F/1iNmCDE+aOGy/
	d/aKqrrJz5Lai6j1/VTJ5Fjtlj5KGyQFPfZ9UeBkOZqxQzpk/sFXw0FA0RDY+6+nNd3+U1Fd2VS
	wkjNlb71IS++c7ncNcYFAEkIlS8HvrIayS20nJCBgM4tQ843ehAMsBNseT7/kGk/nlidPHBZ+6N
	uzr8xlWP1ohmWhhoAvVDIONKDi4gbWQS2h1AOHKgLjKCPKMtPGTY0nsd2SLgX/ipu3jlf9apUzc
	cPMySRDIkgVCYFRamlddGANsARzZOxnsApiEIwlpb6UIWhYzr+27a58l1Ksn658MTtgav9ZaCFf
	28E5OW1Q2w==
X-Received: by 2002:a05:693c:41d4:10b0:351:4866:255c with SMTP id 5a478bee46e88-361a2643df0mr2069899eec.32.1792206625644;
        Fri, 16 Oct 2026 20:10:25 -0700 (PDT)
Received: from cachyb.tail18d50b.ts.net ([2804:14d:5c8c:51a3:544b:4791:dff2:6ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm12876887eec.20.2026.10.16.20.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:10:25 -0700 (PDT)
From: Bruno Filipe <bmilreu@gmail.com>
To: rishabh.jain1198@gmail.com
Cc: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	superm1@kernel.org,
	michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] usb: pci-quirks: always assert xHCI OS ownership
Date: Sat, 17 Oct 2026 00:10:13 -0300
Message-ID: <20261017031013.11055-1-bmilreu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <178832755831.50581.1058201741431375556@gmail.com>
References: <178832755831.50581.1058201741431375556@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rishabh,

I tested v5 on an ASRock X670E Taichi (Ryzen 9 7950X,
BIOS 4.43) with two AMD xHCI controllers (1022:43f7).

Previously, both controllers consistently reported USBSTS
0x401 on S3 resume. With v5 applied to 7.2.11-1-cachyos,
neither controller reported this error across four
consecutive S3 cycles.

Resume also feels noticeably smoother.

Tested-by: Bruno Filipe <bmilreu@gmail.com>
