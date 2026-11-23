Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=68.168.211.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459098;
	b=2mRTcgba9fc2ShnJ7XlGkOrH7dcgb5UnLmv3RKAD3JLiS5SeaeNvGQ/ix2Lo9JDUhgNx
	 3BnWpsPilvWtKs8oUZ/W9jQL9RgGDm8AuCrr2++c14qMVdiWbIdOwY1mz3j2AguMu5s8a
	 sau1T7bPJXPgsN9yZVDcQf33va+Y4PfYXXgBvzdGVVptPzz8AUv6pIiqPQpcMG63gOtRL
	 2c86KyhfqaAUmm3eseU1VnAz4ADi33UBG4FI7IKkP85Th8PH0PGn9vcz89+uI6Js+jSMn
	 qulTtfRoI1Zk1rGyF1lYMeG6e/3os81wM5xFoNIeELB1vbHkE0bAGnEvDfr2GHS0SRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459098;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:X-MB-ID:Feedback-ID:
	 X-INTERSERVER-ORIGIN:DKIM-Signature:Received:From:To:Cc:References:
	 In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:
	 X-AuthUser;
	bh=Daonu5MaMQ1YryPyX9t6g1tc9acAhAk4jn9vtKV/HqU=;
	b=siHZQ5HqsLkTPneqkZ2JkM+BvY20sf17MDbDhtZA7EFJC0L/0S8rErgK/ESWdG/eIopy
	 ZrvDv8DOg7VOJ20UqCmHkTLNnsddZgRQQVBUGVQ/JPIyBma6EAKRF22N5hNCWW6/gddJU
	 IJDJlINZcC8RaLoF4p54g2YQFiEujyAGaR67UIXHoOMJa4cYV1We/6bdsfkn15BdMZHYB
	 +CBQKQJp+WrSUkYoZ2pepwh8jupwn5cSY2yIRYhaL1SwEfdKLbAxeJsdunCS8S6rbizM3
	 emXQfo2wvmLCmFpomFiCCJ3ez8FwPk5llcS/o0RPft0xLPtpFfRXtfYuDJsm1GWZzlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=albefly.com;
	spf=pass smtp.mailfrom=albefly.com;
	dkim=pass header.d=mailbaby.net header.i=@mailbaby.net header.a=rsa-sha256 header.s=bambino header.b=DFF5w5jQ;
	dkim=pass header.d=albefly.com header.i=@albefly.com header.a=rsa-sha256 header.s=x header.b=FtWb0dVP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=68.168.211.170
Received: from relay2-o.mailbaby.net (relay2-o.mailbaby.net [68.168.211.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E631C606A33A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E631C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=albefly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=albefly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.a=rsa-sha256 header.s=bambino header.b=DFF5w5jQ;
	dkim=pass (2048-bit key) header.d=albefly.com header.i=@albefly.com header.a=rsa-sha256 header.s=x header.b=FtWb0dVP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=Daonu5MaMQ1YryPyX9t6g1tc9acAhAk4jn9vtKV/HqU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=DFF5w5jQddgHRrAzHxMTakXwfvYipwSLIp41KDD5oS9crRuDhgEmH4WZAYzD/hHk//w2Gsv6a
 sgrmfvL3qBAIKEwxbFJsrX3AhPF6CdAjgPewNurXrRyDlpdUwjqQHWtnRY/qNMORvHxSdmKeLTS
 TmPnJCF/nL896rFIbfJlxQA=
Received: from da900.is.cc [216.158.229.242] (Authenticated sender: da900)
 by relay2-o.mailbaby.net (MailBabyMTA) with ESMTPSA id 1a209b36cf6000b76f.002
 for <linux-usb@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 18:38:03 +0000
X-Zone-Loop: 57405915f7b524d84541a82bf82065a524d851fbb5c0
ARC-Authentication-Results: i=1;	rspamdcluster1.mailbaby.net;	auth=pass
 smtp.auth=da900 smtp.mailfrom=alex@albefly.com
ARC-Seal: i=1; a=rsa-sha256; d=mailbaby.net; s=detka; cv=none;
 t=1795459086;
	b=QYqxiGYYba0UkOu0xbeOn7neAjcQfDSCbdgLyxN5HMs/MgtBpcUgAIKLAOJk1tMdZaTCVA
	dkTONvOwR/yuLxvOsFh0eOFLTE/t0cf4nJau0tP6K8YHezjIrpz6W90RLZuoiB8iHQHnmc
	Eu032jfwHnEhgRC3LY5Vw7TCkjaMzviOxYhTozfQrmwNJSTb96O1WbWD+B4d20I0vsxy9r
	5IrOI0gkrGhTmd+WsdJsB36JOT9HUixqpc7VrLCfFb2Nlj9cgK0n8QP5CxFmZ8HNi3Am6V
	+XHqfO0amDucxWPa1NAtEjqnKQKAS7eB75QvNmqCJ7b2cZyxdj+17eqRzkVa3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbaby.net;	s=detka; t=1795459086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Daonu5MaMQ1YryPyX9t6g1tc9acAhAk4jn9vtKV/HqU=;
	b=SfxpgMqhwyHPhFkQOAKSILUMtsQ5SibnWaJ6Car1q56ggkwYYvu+RlF2f61KuuLjjuhbpy
	5lYnqWnR8Xc/+zmtcOf0CZoAXjsZID5bUcjBag0HCdR6PZ1pR5iJ2k/RSlS720ViklN9fh
	6tM9wm0ultXWyjke2Yks+XBfjbQdXOivfcwDNPTvs+XBXqmh6tLvrd7tKrG1KPUOzNgghW
	cAm4a44hSgm01jRqOfB/auAvRvjynDNamK1Lbr/ip0Hiz5gAyiPZJdSPpRDjDgJJ5q5wYj
	DhFPrv2UZgojz8d1xsCJCL6SMze/vbQvxc6MG9x9ttdbpN+93OoNwfU+zwyp0g==
X-MB-ID: da900|alex@albefly.com
Feedback-ID: da900:albefly.com:5b7b42465846515d4153555a4b5d78:mbaby
X-INTERSERVER-ORIGIN: PASS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=albefly.com
	; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Daonu5MaMQ1YryPyX9t6g1tc9acAhAk4jn9vtKV/HqU=; b=FtWb0dVPJjSCW4EyBbNoqthhcA
	bjNZP8/4iFilZgfQQL6iBdrL/khduJaeaz0zd3a/7UC4srzOh3NyB+ZaFnKB/1oMDLTe9EjNm0Tif
	VtAHIYSWbNZNF1Yzqly0J2WvbpxgkSnJIyy4D+UNMhvzz1xFdq0VWyEcgVXguhzm7mPEyEwdgXvEj
	fI0UT9rOiZG/lX3Nzg/YZvy9HnrGRYqP0DcMko0H82kOnJY9IOE09s3lr2J4zEHuVgTXjzgNUnsnF
	hXLllZkmOrhruzc91y8un3v/9EgacmWU48eJ5njWtTIeoY17tudB1TLVMoVk4o1BSd3L7ARPSYSWi
	7YyUgu3w==;
Received: from 47-197-78-70.fdr01.spbg.fl.ip.frontiernet.net ([47.197.78.70] helo=AlexDevHomePC)
	by da900.is.cc with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <alex@albefly.com>)
	id 1xVYvU-0000000AsXV-3Y7E;
	Mon, 23 Nov 2026 13:38:04 -0500
From: "Alex Kononov" <alex@albefly.com>
To: "'Mathias Nyman'" <mathias.nyman@linux.intel.com>,
	"'Michal Pecio'" <michal.pecio@gmail.com>
Cc: "'Mathias Nyman'" <mathias.nyman@intel.com>,
	<linux-usb@vger.kernel.org>,
	"'Takashi Iwai'" <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
References: <001801dd7985$c068fc60$413af520$@albefly.com> <20261121103029.7af20ec4.michal.pecio@gmail.com> <2ffafaa3-bdea-4d67-b224-2f18d76134be@linux.intel.com>
In-Reply-To: <2ffafaa3-bdea-4d67-b224-2f18d76134be@linux.intel.com>
Subject: RE: xhci: unratelimited "buffer overrun event" warning floods log (~7000/s) with USB S/PDIF capture device
Date: Mon, 23 Nov 2026 13:38:03 -0500
Message-ID: <005c01dd7b79$c6c23ae0$5446b0a0$@albefly.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI3Kx7jVUantUHytwmcnZzFoJc+ZQKzcBJ3AgOoRRa2YuNXgA==
Content-Language: en-us
X-AuthUser: alex@albefly.com

On 11/23/26 10:15, Mathias Nyman wrote:
> On 11/21/26 11:30, Michal Pecio wrote:
>> Not Mathias, but I think it should be xhci_dbg() like all the other
>> conditions which are device-triggerable rather than driver bugs.
>> People can still see this as -EOVERFLOW status in iso_frame_desc[].
>
> Agree, xhci_dbg would be better.
>
> Alex, can you respin this patch with the xhci_warn() -> xhci_dbg() =
change?

Done, sent as:
https://lore.kernel.org/linux-usb/20261123-xhci-overrun-dbg-v1-1-4e5a2f11=
740d@albefly.com/

Thanks Michal and Mathias.

Alex Kononov

