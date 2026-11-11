Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399373;
	b=kvtS7MB0sBptPalkHimKNKovEyQmdmlyxhiMvRMCCGkwmpNDaTKRTEzkSmKH2y2fEBto
	 lbYMgU9CPPhW9zxQuPcj/nnnmT2ar39N85UAH39xc1ZqjG64Zs415Tk0brae5yjFshUFw
	 QmlFN3MSu/aZv0TYCdlQ7zI1ZHuIOj+Rm66n6QxsSRw+2qjjhVF69mp53uju/wQE5Awz2
	 UDyIdhVP5Bh53fgYmSalHM2sWPYmKUcvZ9yn2YlgGhl0S+6AfF3pYxjL1NN25PGVDMctB
	 Lmk0Yp4CArg2Kqlyw22BbYW3LAskZaiba6xP4RtOLYuFZvqAIRPHd68YtRyFiM3j2fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
	b=2pVxBTyxCNxsW8e6rzE/RktDfcBeCVbIsJbwsz4G7z+UtIcqTGt4vmmYzIPZEy2qp03w
	 qvEd3VRsnLIGfAuz+ib37DGnXZ/Dzyirt7+uO0oauJ2QR6qjg2uQfAl/f3fJ43u20PZbg
	 wKScAeMrLl8yXO4yOJdv4Rz3MXzzdW+NoV2U3YXggnsaxGPJA88uxx3KvF0RbcU9oNaoK
	 Qr01SwIxqjVZl8H8+BfzOpN3aotIPa/i//2CihShxhgJCssTN0vydZLHvowUHd89zP8sv
	 QtxD53yv2VCJfmEHHd2RBlo0Q+Cbe+1IPKTbmsEdW3I349bkOzI4PFdHlreZpUPB21w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEVRdnEH;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9CF606A8BB
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A9CF606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEVRdnEH
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f563d1c6so1200151f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399371; x=1795004171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
        b=qEVRdnEHKR9SJkjIwuqUlDKDa/eqsVO8f8iPfjDn4hG/N9WCGa5Nx2Yzwf4jVz/kHP
         S9iJpa6mOIjzz9wzGG9xnlTiqQFb04tfHmnI2GpXWYoH7Ypb/cYSbYUMfOGZ7Z6pXusm
         26YrjScF08lM9kmPxMQDDfXOV14+jJMUASRjw/dswBk6bQ+pEJATDLKwR1bFJzUYXI43
         3Yr1kJ1/SOlD9lyDQxxHULgcLQtFLfdxu5o6tH1gR8wwTgQSWcNXM5mVk7u1YtT+cEFj
         ZMPphlKliUqEb84X0pOLOA2MaQqmVRS2zr3IeJPU/5O//YJj61HeVp0d4OiEZZJbogkV
         yM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399371; x=1795004171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
        b=wkVs3UAbZgW7ZKwf+mYuHLfTa2AkYhpycD6TG3Ljs9ac078Q2cCtWjv1g6+Wyc+Xdw
         l8Keg9sWdp7ruobs3N/QYfGvFFdvj1s9NPWRZ5u14XWuumV2ldkudn5yVc8OJJHVgHSl
         gWTk03nRy/vCSLg3hW8YPIbf++erqxFxdN+285aJGpbAX0+TI0MkwloIMR/dbfyII66t
         UoNeDhChyMIKxu62XQXlco5E39AhTf5HfIhj8CIBzp+Y0xl36MabZDyjNF8gbi4RINDT
         ETPOGcOsSAKSCs444v5e3nDpqr63CGb8chiqPxYaBZHknFBdjGrtjZz3zqV8hdnCq2CB
         SEfA==
X-Forwarded-Encrypted: i=1; AL+hErFa+aOwkz+BpXd56GRUz9RYtE1WaEuwd+WgjT63Dt3AFj1peow2EGTLdSeyC6Ty0LxONFf1duRHJCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xXRDkxkLAS4JpzWc6x1X4OGIr88E1JJMgR+D6Yc9wug2hzbuL
	bSW3ojvAPjj62DWVU/4M0Ua6XcPQ7XEFZChygbd5hqSYXqt1e8InD0hL
X-Gm-Gg: AYBFou2s12nzd0iWOKq2LhEP+8x0TZB/clVPBl6Z6Bdc6RiqwSnE2muqdOd9iXhP0ow
	y41wjVGpvOdhNgq9ZndDzfrv/0CF4422pp6+Q9sjN3EuHM2vEeBJ44DZmGvplgPBpR1oMPKtxA3
	jiFUILSxjBEUku0ks5nhzZ+uxvc6n1gGauw0eAVWj4QJracWqqSNYZ6ORpRjtQZsQ1fVNhXKMDk
	Z7qfYpQcR2l4o0h+49I2P+FvuHpDbvJkAuQETRFyp8JIalh03XSUekSdGt/pkN3ta7iwL9J52fR
	o8M65Jh9Bhq0PqWKetsbG90HTWWWA6lFYV8O1wBe/eVeeN19jBl5mw2HTks23rFJ5I2YYzy97MW
	DXEp+QIwmpBCFHiY5ACEnQ2CBL+ZpGI3FO6QFVR2t87bTai5MxtKzywbYaqJN/sznTIDIl96XOO
	zBgyxZSBT7u/sSG8sSFOeR6CnQvWL0AgVULEqZkVSKAWkfSCp5ihSXZm3ewfSLAxgNkF10LtN1o
	1rx41Bh81Xin97vVvjpfqaRSjuIF6LC2cXMfEhzMqaJyCa3scbiFGoSfec9EAiPZ+gI0/6oC/Hv
	Qrc8Y6X8d5kIv7/WVVRjK5L1WYHGBqT+nK9mpRbdTJpCAShMpZiJ5wSw
X-Received: by 2002:a05:6000:2308:b0:48e:6f76:de9c with SMTP id ffacd0b85a97d-499c6e9636amr3846243f8f.28.1794399370646;
        Wed, 11 Nov 2026 04:16:10 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49884b99869sm9544010f8f.4.2026.11.11.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:16:10 -0800 (PST)
From: Vlad <tvlad744@gmail.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: Keep the host bus suspended, not torn down, across suspend-to-idle
Date: Wed, 11 Nov 2026 14:15:56 +0200
Message-ID: <20261111121556.1871-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com> <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladyslav Tymoshchuk <tvlad744@gmail.com>

On Tue, Nov 10, 2026 at 07:16:44AM +0000, Arun Iyengar wrote:
> Suspend-to-idle does not power anything down behind the drivers'
> back, so there is no reason to end the power sessions there. Keep the
> core, its PHYs and the suspended ports, as is already done for wakeup,
> and mark the device as being on the awake path so that a power domain
> with GENPD_FLAG_ACTIVE_WAKEUP stays on as well.

A data point from a Qualcomm board where the first sentence does not
hold. I have not run this series; what follows is the existing "kept
for wakeup" path, which this patch extends to every suspend-to-idle.

On SM8750 (OnePlus Pad 3, v7.3-rc5 plus board patches) the controller
node is a wakeup source, so dwc3 keeps the core in host mode. The USB
GDSCs are PWRSTS_OFF_ON in gcc-sm8750 and the qcom GDSC driver does not
set GENPD_FLAG_ACTIVE_WAKEUP, so genpd powers them off in s2idle all
the same. With a USB stick on the port the xHCI then comes back like
this, in 3 of 3 cycles of 150 s:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x669fd3200, fsynr=0x370011, cbfrsynra=0x40, cb=5
  xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
  xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint command
  xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.3.auto: HC died; cleaning up

With the GDSCs in retention [1], as SM8650 and X1E80100 have them, the
same 150 s cycle passed 5 of 5 times, and two shorter cycles of 25 s
passed as well.

This is the third point of the Sashiko review seen on hardware:
device_set_awake_path() does nothing for a domain without the flag,
and the core is treated as kept although its power went away. I would
expect 2/2 to bring this failure to SM8750 controllers with wakeup
disabled too, unless [1] is applied.

[1] https://lore.kernel.org/all/20261110213346.1359-1-tvlad744@gmail.com/
