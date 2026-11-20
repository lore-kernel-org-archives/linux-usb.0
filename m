Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186908;
	b=tt+h2x+TkZfWQTKLVLB6qNeMKXPnU/KC8OnezCh2p+489jPZuVEDTh+xhqm+CyUHKyzo
	 q8rEc0AJ6tuF9bXU/tnj5SOTGu9kJR+tp7ZY8JXi20vCirbIz1Z7iWMKQSBuQX6S9aeIO
	 f7hI32e1skFCLa/bcRWji8L4L+KXarbSeOl1unv14qMU/3WfoOongVhlPMOa1veP7Gzkq
	 nV6X3g9DGYKP/elyJAZ6c1pHSUcOstWs60+wcqDwCylSp7kqBZndngfixipDY63k9S5j4
	 vxNNa/FuXC6rdHeCz0TG1T8dRZdpT6VQw/u5Kr4TwBJxn3vJcajGCrg+8NlWYG2jstw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=UeVDu3TiM5Vz6KYQ4zy5qxzuulWda2oFHtHtn3T8jvk=;
	b=bQfmRXmzdGYbIqYyXVKz3mAmUMbm2YTsQZLjZrPMV+A4ugCv8EGPeYL9MflH+AGY8NnQ
	 XKn9TGQN+7Sid+r5spX44Eh3GtY9dfkCbnUe7zne9XMTP2wVNv5X5ZRGzlk+QA3oXSxnT
	 nXV0Uh+mLPoBdfSdGSnk1Tgsugyq2R6AitljqNS6f7ccM6aSDXOJAD39CmoS2mAee+TZE
	 CYPSaycwjbrVUDJl+0sIbDdsSi8Rk9lAjMyeG1TrQ07ic6vGJt7J83m4+XJErbYh8hQqC
	 q+PsWIrNZGFiLvzfvfAGr1znSIXE9T4AW2XMXQI2P1vZRPG2aSH4KMwW4a3kxY+i8mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LISZnTJy;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B22E606A831
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B22E606A831
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LISZnTJy
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so512677a91.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186908; x=1795791708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UeVDu3TiM5Vz6KYQ4zy5qxzuulWda2oFHtHtn3T8jvk=;
        b=LISZnTJyqLv3LTB7PkrPUThBJeQR0BHqn7qD9E1Ag9PKjSJtfRbiFz+iBJZzj7yl/Z
         xFogTX96DPjXvEtX6aUrQTNh4WHnrUn/h183GHEuiJ0e7I4LdJwVx+nQaePoov26GafG
         KNc5N4QnmjcaloWXmOKn0b5p6n5AoLSFanJDrN61xFBf+yTBC9wyv+T2pXmL4qh5j2rT
         ecK19Bu+Y18SZepHrGQgR5cah9nhN61Pk82D66CRbZpTvCN1d2f7HWzqyUL2B+hVcHTc
         5w0tA9Tu6DuOg6Z13j5E5t6mP9hbVB/F6Scfb9l6XdKeuYeIcYbkzh/foD2hx5Jhfx81
         cPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186908; x=1795791708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeVDu3TiM5Vz6KYQ4zy5qxzuulWda2oFHtHtn3T8jvk=;
        b=zJ840EHTkKR+VTTSbADAZ2N+JBRDfQusKuCEwcnQKc8+qoOs+q4pgE7mzPAPk1iaK/
         MthtmdH/vFucgbhtm7f20so7GAE03jVma9NXv7Qurz1iv4ub5XITXtcuuwu2JJWdXTM+
         TV+ARjZi9+CZlTV/UwrWaudoGOV9r03VSe2p0+w9AnfcbM6tXWjZwlzGbgnCBlhDin5U
         WTXFY26s8vnJzJ39BnqVx/bHiEoDy9hgzaYuVvsrroPp+6ZaYzUIRGZRYeTy12sFanbf
         u/y16qt0d0EyJSOwLvUkuiAnSXy+y/OjMDx/ge7FaL54jcF+wDF52QBDNv2KxC3cXVvS
         QaFg==
X-Gm-Message-State: APuU4Z9xgEgGwIic0Ar+ynufI8k1EKcwJZUXPJcx16UBwlsYvGwFBGpH
	Yub0q4qyO8POm+H/EBCpX63TIwi+DlBc3LZ4Zz1LBPskaPrbuXcrs8AlMaH3Lhp+kQ0=
X-Gm-Gg: AZFdTZdvCAnQ1tbpxE9h0xXrb2v7AxoicnKMjtPN7PgbLhKn0w8FrF9MjaCKRLmSA58
	hRpTIBKau4SSMm6GKPJ/xadvXfwE3L/aAeHyWCg8Pi4AkH9+Scbu7TreW35Qp5x1yJhLf2XJuVS
	Z1xp9CqbucI2yCVISGdmDMvfw8OkY+NrDyRPFGIe6qBCg2f5C0TV+5Kmo/tpDr9uErbxG1xYBXa
	ByAsvaQNivcAsMA79JxlWx6m9dcJMYHLEPFOThbx6MLEAs+nttaZF+ghXLes8i8/AP+1k3IACIJ
	oq+tNUn8Kx40CHajtbV/LXk8gPhiSfIfmdS7JLY6AX84FcNiob+eMs8YAFIhjYzE10yahgBO5o1
	Aswwahs7p7M9PwVA8rRpPXD6TTsZSwduZni1uQ59ek/2ZmwcNL4lNtFHWEU2arsu/IOYTu5T855
	1u36h41eexEzrtyCWqhbq52AVL9bi7XEH9MBSqSqSD63ZOeyWMcUy7uVPcRkCVMqgs7JZ668atl
	JAPDGh/LQab56E9tye6xiXr/ricD6uII1ULSDCkS3ptM4y0bG5WI/NLP0kcGJdJinESZsudX1UM
	n1CLV2p6k8HvAJCQ2ICkP2HRqiPXLSKpb5pqAPuOG9s52AgB/Zs+H7sYLCTTLVPDW43AZTDzbLM
	fQ/s04DHBUi5zbnvOBcPNI78izhuf9PfP7XW7
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr2948394a91.14.1795186907561;
        Fri, 20 Nov 2026 07:01:47 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm7543261a91.7.2026.11.20.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:47 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Sat, 21 Nov 2026 00:01:42 +0900
Message-ID: <20261120150142.3128421-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
References: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Oct 13, 2026 at 10:54:16AM +0900, Yehyeong Lee wrote:
> usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
> the OUT request completes successfully, looking only at req->status and
> never at req->actual.  A host that declares an 8192-byte WRITE but ends the
> data-out after 4096 bytes still reaches target_execute_cmd() with the full
> length.

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
