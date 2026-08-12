Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D585C391517;
	Wed, 12 Aug 2026 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526944; cv=none; b=Owvke4LDn8J6dN1ay+hmJq06lYAH3WEbadQR/CSRPEg/QoWt79oi6D0t8+wUGaOgXNdWZh3k7zDKXm8hV4q4c67E+2Z8KZ2bg2eqVgz/JmD02MtGRaL08Eypf6HPw3xwf0fXCCsRehTht+eifQ9Lr0/aDE8bEyYaqp2saLU84Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526944; c=relaxed/simple;
	bh=ReGbw9ZXSPVEwPF2Mj/CrDT0HhRCGthy7k8HYKTpgD0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FKY+tNv1bVPAWVCaI8Zh9q9/uFpuWT99/wb6ZlqTen+3veJ/BxO9ehNarbXFbh++SJdwWsvKp+qdDw7lHREduPebpH59oBUmrfam4jeuuZK2T8PE+KNKhk6f5WpCGKaUrK0EDY3Ss/MbaKJP3vGQB660FdPM5sC514RqCCYR2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=fmyCAaQy; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="fmyCAaQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526884;
	bh=qB+/H3S2X7BMjnr0ICRuhR52sfo8kzPSuCZFAuZw+0o=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=fmyCAaQyes7HuLJ2DGnl/XJKBrjB1zRY66VKyx3f3EGMSf19ss5OG2sBwHoD5xaMi
	 IjJW0hp3KtEU950mUMEwHuFY6Ybki0r0wZsa1JPJD44mjKfLBXXyfmYyo7azsVyuDL
	 Juf6INnbMhRcjPT2NL9dsuE8UvkbKuqqQpAT6lgY=
X-QQ-mid: esmtpsz19t1786526876te95e4c53
X-QQ-Originating-IP: RY/1MC82IrCsdcYTGZLXVFLnTyzy36nZuSIMg2RJDcc=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:27:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15981985758857331852
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: [PATCH 0/6] Add SpacemiT K1 USB2.0 controllers support
Date: Wed, 12 Aug 2026 17:26:11 +0800
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADM8fGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Mj3SQT3eKCxOTU3MwS3WxD3dLiJCNdS/PElLRkIwvjFFMLJaDOgqL
 UtMwKsKnRsbW1AOoBoKRlAAAA
X-Change-ID: 20260812-b4-spacemit-k1-usb2-97adfc283d58
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=1583;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=ReGbw9ZXSPVEwPF2Mj/CrDT0HhRCGthy7k8HYKTpgD0=;
 b=Evblc79lgcNpx3HYnRwqZI9e6iA0XAm9NiS8lIKQ9gnoNCtWQ8DCdjZkcQC/7WTQdS2Owg7AT
 BescMQ9I1ABCAisEZX9+lhfALrBcFdcOhh4Bh/xS8upASvv+Cit+knq
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: N+n6UtIkOPCayioRJ3gNs+GKMPf4k4Uey2GIPnctCchUwtBRAfz6EpJu
	u4VrzJwl9FjvVMWj35QNpsf12DBHHZpwLrEQOZFVSsfpheVZDIFnrgSMiNPiHuc+8PI5MJF
	TGI+dGXh3erqIO7EYxKChAYgFtZNTw6Cnf1Bswk1vwrrkzN7+j5R27rKVA0ubAgkzbgM+AE
	MmDn2IFIIIDfcJ0EJbiw5B0QsGVa1XWa3InXI5AxZlK15GAeS81v3776wl1E7iei2p+X9Y3
	EvGm+O9lUf1g+AoFDs2aL9EBE7ugU8KgL/GRfU75dsBNAomPEO+BmbxTxtFG+LPc/lflr88
	PmkNWb03xdbMSQFqp2+ioLrUiqBNugd6bBtYPWQknelR7O3iGcKfnG2p2pUTK2+JLu9em+Q
	ekDOx2V1exW88aQnmA7uKwey1N4CSDJVeBpqihylEiuV/gAozu5GhL8ABOi++N8wkUAwVTs
	OyVf5/dgsGLUyXgMo/MXPs9fCfKRgln+zMdEbwHZZ6G2LsRIbfNT3ITeTY5L0LYDPCS8ojq
	Jypf8DhIuBPW8rTgKpl+uahigIqNTRSZMbkpbcigRk4DPHXjrHlE5robvm5uyWgsT9HmUda
	pB4UPwXy0jHATJZ3MDvPYbIrrCZIP5WHKL3PGrRxs9EjFZbaryVbichB2I1O2lGAzNvdXb/
	c8OLv7/0S4YhswDAQ2a++D49CH48RcRdv2+WH7Ke/RbgzQJBjlSwnuGsEGFASd7o2fQ8VN0
	98J/sfvsUetqqfSA23FTyKr7XRjSciJ6qOo7mGu5OfVgzZl8O+ZwPJ/4gUzksoDesb1g+qv
	17J2mzl6E3sS/wcdBJ0+NmPAgMmuge7s6Efzlq6o+LtqzYZ9XW8BzcreuLb7bZ6qy7/QVG6
	1nBFI162xO6edCaQMABO8oLttXKrOESCEYH0aH7/CUaGfdjG75jPFeeJ1DRgofv/OFOXo8y
	lW6DRYgVvCN10tXf+6rCZZhIu/Pfa+0eQpggKJw/FU2NJ3Y5otgjRtK43sbL7YWRuqsEapx
	YQtcZZtGT1Ga9tD1W1uTLolt67ciJQlmug6lZ+Qcv0AUOKfI8N+CEq3TloP4a2cqasEYJuj
	Qd6/IURQdd53z+LPDjsptFt925asOtFCZ4c3KPw2RgbAqhjDxnVJO4=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support.

This series is based on 7.2-rc1 and has been tested on Banana Pi F3
development board.

A self-powered USB device/hub is needed to test the host function of the
dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
cellular module e.g.) is needed to test the host only controller.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
Junzhong Pan (6):
      dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
      usb: chipidea: usb2: add optional reset support
      usb: chipidea: usb2: add SpacemiT K1 support
      riscv: dts: spacemit: add USB2.0 controller nodes for K1
      riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
      riscv: defconfig: enable ChipIdea USB controller support

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |  1 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
 arch/riscv/configs/defconfig                       |  4 +++
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 16 +++++++++
 5 files changed, 77 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>

