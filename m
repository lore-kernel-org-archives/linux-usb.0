Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030472;
	b=QXzq7/DXUotwNYMqS5UFtgOh3jIxmYNojZkDhA82Owdb0b6M/oMGRA+3DLpnF+CnCjoB
	 bA6LQ5ooOrs0Ya31eUnK4FUTrXogBWowmFwEo/o+4vziHz129vuUqKXqhQaMD9DV3xT4L
	 JB+wHrweTXBOu1nFemX1mo4EqRzkgF5rTKKrLTPcLtKZaBWsfDle2bZyfjeCVXsgGomcd
	 kzsCaBUNuY7tUwKAJB97m638XCTT9O6ks2wLDfvZuahkE9VnX6RBxTvQKd0USiDyYD2YC
	 Buy7DlqHEW44rxx5Esycj29QifPMDzp7flA4XZKGBh7TGJs420nbG6t3enhVnJzvtng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030472;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=p3qO0spke0SGbrwHQJGFcHxU2bob8VmRhcrqXDKZr+0=;
	b=OGp1TGr8tJ7ZIkLDvzUZ9PO7yKsb0CxugyrsnM+cWqhSD3izh5nLG2Kh26UWqKMs8Y30
	 TRE9gGDFkBHJDNNV8cfkPyabVMwQzsCUnFxBwdpteSqJbxRCDkV5ZDeO723ftTiKbfb5i
	 TUmyPfoYYH0FoT4RaFTCOCbjugL81IPsm3umX02/4uqgUUt2zZn077gzdIF1BkvKegk9n
	 NtreckuU6Q4qeENayORX4TOI+37D4j0NNZmUpRAGpysi/J0BPJlnZ+hXRv5ITQEVV0Wx/
	 +ZwYKFoGXxuBYJlAiKg76Hr19A3BI0MX1SWWVYg1ZeK6eextxKH4DNJ9hiZGSGa+/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CE7606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 05:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22CE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADH1pd6u+5qDwF6AA--.18397S2;
	Sat, 07 Nov 2026 13:47:38 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org
Subject: 
 Re: [PATCH] usb: musb: mpfs: unregister the generic PHY device on remove
In-Reply-To: <20261106-coveting-unclip-525e1e9dec65@spud>
References: <20261104021522.1468663-1-vulab@iscas.ac.cn>
 <20261106-coveting-unclip-525e1e9dec65@spud>
Date: Sat, 07 Nov 2026 05:47:34 -0000
Message-ID: <179403045494.2324069.15566749996224490311@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowADH1pd6u+5qDwF6AA--.18397S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1xXr1rAFy3ury7Ar4Utwb_yoWfAFg_Ga
	4vyr9rJrs7AF47Kw4vyF1IyrZ09r4UGrs3u3yY9r43J348XFs7X39Y9ry3X3WFgayFkF1D
	tFn8Aw4q9r1j9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxAYjsxI4VWDJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
	GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	j0wZcUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUEA2rucA5nSwADsO

Hi Conor,

You are right. I checked Felix Gu's patch from 14 September:

https://lore.kernel.org/all/20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com/

It makes exactly the same change in mpfs_remove(), replacing
usb_phy_generic_unregister(pdev) with
usb_phy_generic_unregister(glue->phy). You also provided your
Reviewed-by on 15 September.

I am withdrawing my patch as a duplicate. I should have checked the
mailing list archives for existing fixes before submitting it. I
apologize for the unnecessary review work this caused you and the
other maintainers, and for overlooking Felix's earlier contribution.

I will check for prior submissions and ongoing discussions before any
future submission, and keep the submission volume within what I can
personally review and follow up on.

Thank you for catching this and pointing me to the earlier work.

Best regards,
Wentao Liang

