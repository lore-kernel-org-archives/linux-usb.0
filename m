Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186920;
	b=2Fxw8QQQOjAoCefQlG63CjtQV5vsBRKQG0XrX0xwIwjEqBasavFkWZ5K3CIgxHHNtCR5
	 Qx8O/HebL1l3Im31ZZvuopcOrs569GObSfi0qMgDmCg65l697LCHYr/SG4AneBrgzDpCr
	 jhN3gyyhNqA11hN6FaASjiaqyBo+CnYrDNFoTnf8bjHGsprU1mP6sFU8Jf3dMXRZ/jwj7
	 mwBZpiEygVmgGcNoZQ//73kb3uElHdv97q4YXJWkmuJtdPSwiXt2kuhZ4dCJIGr8AWjDO
	 5isRPqG3GFFoe1M3i5IFDuE64fD/+A7jh4YPdSwoPfWJrnLVRMnHwPFpJ5TMVlc5nGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
	b=q4B3dk75b+83++dM0d+LB3Dsvx8AJ5FlTW0BGUiMQheRIfNBelDrx1L6HuDcOfPxvLnv
	 PnwA2x7NMQ0sRjoH0zDRYh+UKUV1Rn8nx/bcBpGQXwULZ5VqxmRe4PKdBIPVBf4GeuhNr
	 J3mjJ9lMz2mC2LwS6iYQ/6qSy+61LEhMb2nr79lAgldegM+fLL6me9DXlk7oC2qQBOggC
	 0XFBSNF6AnttssS5oasW4xTjOb3CW5kN8OOSauSTGVn+MKOuF9lYwEnO2QAWKtgmAYQ6n
	 mT5SEWWYtcCLK9i1rEZ3NQ2SuXVIZ7gHa7QH3wszvNUZm1Q5UO0wKjWVyFMNXECqurw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V1muv4aO;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39112606C868
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39112606C868
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V1muv4aO
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b2f59de176so944275b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186920; x=1795791720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
        b=V1muv4aOu02L+yE4GAaHN7SP6R+7IjUh8YEh5nx82Yg5Xh8xNHmJDgjDfvfC/ucUjm
         cTr8PmTaextdDJKUU+q20INEYhzxAv8g3wboLhaDeINx8UCor5YAwwfK3r77RL79gQUL
         nvI9YZpWdyh4i1CUrh+3BxYlWTNXbRfdNSO/7PjTlU9qOGYrLTO1FJDWavGJgG5lbgQl
         86hOm/3Bj2KivYZhXFdAWXugZftf1SFw1aWrWS5Ft9/E+N4aUJJyvGimLbMVvTQ83pOD
         yL0DzPzHx9IrRc1eprEVMr9D5trEf9y2Nc0wwM69675ETUuocc7UKxOOAj6El/tge0l3
         aC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186920; x=1795791720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
        b=h60nTMuCorEounjdbs8Wj8JHS3WLo/vyzp8QCGopJ+e8iAehH6unnBYN2cKSJQBdrk
         aXNM8T0M/E3YNcr2+d9N9Ur4/WTrXy1fs3hYYXO7QMYXhJuARYw+ByoBVpQmpyvjSYiS
         Tyrbq65DPZn34oevuzAoAwB6CESD91PQgv984EfvFyawLD879fybEGTr+08rYx7uP+QJ
         OcfYqatM999zjM8nlWWnK7VHeZmAAW0cMELcMQ/IIp+Y4Se4VYnk1QzJaJDTU7YEo3aF
         tyqjyofDDRLDOM5itorC1mShLQYuUJmVKRBjorTZCyytQAia5dk/ZwwE87sFyn7KNSor
         bdgg==
X-Forwarded-Encrypted: i=1; AL+hErFTNgF53f4tuQ2yxHmY8ZZXn1YQszqoL8nIXoZmSWglQBBuYuMBNTMgC5GqcZ5AmG832rrjCDpdDmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z86jTz1yMczdSZSZmPIemuZ1DZ4ZQQTuHF6EhuDivPu5/I1nzIp
	Zm8ow+vml+lC7EimzpEbIE/YyLrjlVNfZoVpeOPhfOl0vrLQEB5HbMg4YQZVssYa6QM=
X-Gm-Gg: AYBFou3OKGxjgwc+ineq9FrQGXEp2QSwlaxV9xqUkvGYANLhwxANkbD0ohYsjOMQ3pZ
	hhtC38hCU/ntAZRHtRMAt0fZzgumJ+nzzqcq1ShNnVyEharYRni62Ep7cdIN/ZBRGJqArbKvcy4
	P1aCSa5DT2W5ELCpxZhAQGsLTrlDGnHKsSvNlvAfJfdIt+5m8OB+zYr14+Y2BKg+AkKHUwj8cAk
	sNUWqQKUmntH8QChIzWhiyhAVBduk6zQno8W1N9lYQn4Glq750TnQvlsEg6lDKCnrUaLXgj+KKf
	Ja3EGxb4gJJ6pSUm1dl+pryYS6MNsSDFBjRA2b4KF8usI69qiE966cCZKxS7FYXiw+I3vFOf8Rx
	e/zOAL7vHn204Qlzvf9gyFMiBxQCtGob1od3oEHfDS/mO4rcek81FvzUbppWpA2ItlfcpN2Aqdd
	0Bc2uM7koiaRZOP58HYV/+l8vXIA4KNMr0g+zPY4/zPc1Yc5k8i2xZ7B8lUNAGPglD691wAO/hG
	bVMCHE57Ov6SitXjiRAp4TALTMhu9ZJu+lGLnzMGGxzL4aY7S3LsghTUDRJLODF5ASzlEyuUxLe
	iSI7X743DEMhU3WN1stFTH/75O14usLHMzBFQzMtPC6VP17nATmddPgse09yvyIRBrpkIKmadS4
	yHVPzXCydeM8e0JCdlJDVlr+ey5XLeYCjdbaFNg==
X-Received: by 2002:a05:6a20:c887:b0:3ff:f20b:d2ec with SMTP id adf61e73a8af0-4014dd66078mr3640804637.52.1795186919522;
        Fri, 20 Nov 2026 07:01:59 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06503dsm1398731a12.27.2026.11.20.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:59 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: Re: [PATCH] usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd
Date: Sat, 21 Nov 2026 00:01:53 +0900
Message-ID: <20261120150153.3128458-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-223285@kernel.org>
References: <20261119140641.2768465-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-223285@kernel.org>
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

On Thu, Nov 19, 2026 at 02:21:37PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can usbg_aborted_task()
> dereference a NULL stream->req_out pointer in Bulk-Only Transport (BOT)
> mode [1]?
>
> Aborting a task in BOT mode therefore causes a NULL pointer dereference and
> kernel panic.

Right, this is a real bug, but it needs a non-default setup.  With
emulate_tas at its default of 1 the core sends TASK ABORTED instead of
calling .aborted_task(), and a BOT session can't send a TMF itself.  So
it takes a LUN RESET from a second fabric sharing the backstore, with
emulate_tas set to 0.  It's an Oops in the target_completion worker, not
a panic.

Fixed in a separate patch:
  https://lore.kernel.org/all/20261120113956.3071640-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
