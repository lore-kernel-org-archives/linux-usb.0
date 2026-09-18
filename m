Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826343B6C14
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696251; cv=none; b=VVUH4cRABf2V9wg2z6PbTM1EB//7OVAUIqCmnlxi+hLFYso3PCEVl0Ven93428ppzP/EAB2/TY9ClomNErBDbv2fyx0UR6Tv2/25AaciHZVyik3snhBtFBi02MnB3dsAHEl3aWg02mXwDXa1r9JaQAOSPlubdrdWLm6Obh0CTJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696251; c=relaxed/simple;
	bh=U6Ifbz5x0kVweq8mt/nG0FzHuV5MzqSu4AL+yPCKtnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jikiOpawEfPoC3GRe/1wEvzhIOHr40zB0z6JUFHHHkHTZT1Tqvqy70xH5S/5vJ/QS06Os4pvhvFOYDyFfZgFefI2mVAtWynTGSN9DetKjpDmUDTSQOykZNQFXoaQ72TBD2jkn7AEWeH9Ah6OXQGja5KVc1Axx1MpMATyAlixbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=hSrFgtXA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="hSrFgtXA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso951575e9.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 18:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696234; x=1790301034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4QKzdzhXx3trVjHguVbL/tPhlBogzEsqfZIRGP8UlI=;
        b=hSrFgtXABYXnSOExmVjFqhtGmU5DyE7hDkypLTvCcKKpqkFJWJnFee+IPpdiSX2+Pb
         UbwMInoJOpbsSc2WxidhFtjuwpeS1OYbFCByRh9O/mIKgPAmEzErQHlUhdDR7exurQu8
         4PsgHOx/tkYaBOMjOfBLkkJzk134djbsJv/uUzwpGo5PKUxNO9ukVUnBiv5DrJkycLnL
         iz20N79ktm0wezPLKPUxz6aRpDg/z+uHyB5BVoVMC1c8MeXay7YXbKYeuXbCs6Bz5wNU
         by9A273MpD2OSkXP1e0ufghFo3JyQjfG1CNS+AVBHT9wFjnD3/GiJjZRvFoNbDBmb6GY
         4rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696234; x=1790301034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4QKzdzhXx3trVjHguVbL/tPhlBogzEsqfZIRGP8UlI=;
        b=tx9HRTij6GTMbYCIwnLk7qIQPzGIvVvWn5EsvXzlKy8DAnRGan9eb8d+lwJz8zjoVC
         ElSa9+dabNnzMoLoFPowvjqISnHhqdpBYywVUC/m12BuimWdKxDfoW49jeVn/mxYvO21
         mq3idG+LmhhbTflLTezIa5FZ1uqL3W1NozeCaOLrEF+VCEkHMY5cVL9+xQaaOlZ1tTlW
         IICpqL43x6m4SzeacVBpz13VOcZg3R4zR7Aqnfpp7f3Fle5vNEQD0F+jYeiFH6SM5UBv
         Oz3Ul+Uad7F01C/UOPahxvBty6K1VK1tWnGhScLEoVEw14ZS5VEkNWzrOKuVd9jBusMw
         +Xjg==
X-Forwarded-Encrypted: i=1; AKwUvBxjY9H+76o8GE9bIu39Gkaw0I5dn3cetVG71jGiZV6JWpKrbcFyquHG1IuMHMpMtbQB7hTABJYn3pQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lFtIvBD3gK2mnvAIUtef20BaiLtSTuCPNPzIyzXPge6yo4Uq5h
	EcN0dW8Y4fIFAfbVDysKkClK/N6x8mz8iaFOOrXAgOOR/ax3DNNy8nQK/hwYduOZhNY=
X-Gm-Gg: AYBFou0hk8ifo3weRpkOBV5Ifpaemd4p2hvK4th45kkjflEmTpKyqzTljf8cvlOQKnt
	7O+nL4+V1LNpuwhbLBanBoTPVSjMewJtgna0AJoCZWvWfqVcO1JCifDRF/t/CjNpAKx8VJ2Qpg4
	q+TUbutkXdqFFKNKehTJgNhPpC6k/YgtpQQUTYhVvm8irO/vIeziJWloE8yRDGnjqC5/TG4fQ11
	qe5bDbeiiAGi5Qci9WPRCuHGZyeWJsIu7EPjyHP7nLRsq2I7TTo5iFruKjFOUkC+PpjFzNQZdV4
	Lam8+9BdiuQcLc8KbEv9jPEr8U1yhdaKcl/s0sL5ddlrdildQvsP5yN0PomSdXBcCeh1zzIkxw3
	8SvdPiCmEvg5vcz4sRdFKAbFozfUnkT312L4m23P/X5wsSV/D0Wx5lY8gQV279GWHK1jNbFUzIW
	3Nt6DT5yeIztkTDN0vP23UO//j3I03zzNGiMdnIVnnGNGsCuSnzH4=
X-Received: by 2002:a05:600c:8b21:b0:49d:16f1:94a5 with SMTP id 5b1f17b1804b1-49fc57542b7mr7295435e9.25.1789696234474;
        Thu, 17 Sep 2026 18:50:34 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200745b5sm64224f8f.26.2026.09.17.18.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:34 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v8 2/4] net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
Date: Fri, 18 Sep 2026 04:50:27 +0300
Message-ID: <20260918015029.2518425-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918015029.2518425-1-f@lex.la>
References: <20260918015029.2518425-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt this driver maps for its PHY is written only into
phydev->irq, while the bus table mdiobus->irq[] keeps reading PHY_POLL
for the same address. That table is where phylib records what the bus
described - phy_device_create() seeds phydev->irq from it - so the
number lives only as long as nothing else writes that one field.

The bus is the one this function registered a few lines earlier, so
record the number there as well.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Compile-tested only; I have no LAN95xx device.
    
    No Fixes: tag, for the same reason as patch 1: the write has no reader until
    patch 3 lands.
    
    Teardown order keeps the number live for as long as it is read:
    smsc95xx_unbind() disconnects the PHY before it disposes the interrupt
    mapping.

 drivers/net/usb/smsc95xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 42e4048b574b..130a460c1f54 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1252,6 +1252,7 @@ static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 		goto unregister_mdio;
 	}
 
+	pdata->mdiobus->irq[pdata->phydev->mdio.addr] = phy_irq;
 	pdata->phydev->irq = phy_irq;
 	pdata->phydev->is_internal = pdata->is_internal_phy;
 
-- 
2.53.0

