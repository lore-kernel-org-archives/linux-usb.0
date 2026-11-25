Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591949;
	b=XuVPtBcNHtU2pIPZQMIznvQEkJgX64DspI5ChzOZK/b4ErF4ioChUHpuYdX9MlsImP5b
	 DesgIlyJorrh07DRO0x2udKYxpO3/nqanUwrlMBrkmN72ZpSmot3Vnav60427ktTCnrOJ
	 HyEbDi3QhgtRgiQohs1muafbpsLS9qgD9cjsh/nvSMse/yp6IXWip9sqHQVXqd32ZwzUX
	 GVvJJHCa6tvP70Sa4ig666PIdWtbKogP+fqZQ7wWs62y6fUKgFOHqj3XfYm6bk3ousQNo
	 qmpzgnxsmQntZGZo9+oPveK5nMV49LKVq6UGU5EX6jNdXXLg+FFOJ9M26phdk+lMYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591949;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=wUm/GLF/3xskbPpqCMnGgI7Wjgv0EONs0giF1tRLvN4=;
	b=IV4Htm9wBcYC/2bbuaakO1pNq7gHcBlKbywAloL5I4XVh30fv+mJTL0Eq9a8sCP4eQs9
	 45cSNai/fB2jacNkZgVSX14bYcMOTLtBMOXtUo8Amtr2kPtxrdprbYr//5V8ZJFK7AUP9
	 MBIe7OXPYu10C44Bg3Hc3/DlRKkHIN4RiSyZxNIduYr6kWv/M/I9XBOh0ythqvE/uIixR
	 yednyXR+hYbSkeKtAspsMRFTcoqoRKtluBa8uM04e3Pii0arTJdpTqEkIEZHLCGURiSKa
	 GySrJYKS0fqsViI1e9x1sgY5z61aMBJGa37hocLJKEXJrU2gMN19DC13vxrwTie7NQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21353606A321;
	Wed, 25 Nov 2026 07:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21353606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=wUm/GLF/3xskbPpqCMnGgI7Wjgv0EONs0g
	iF1tRLvN4=; b=X//97qgwL/o0Q4A2amnuoOrRGB+JPCtrr34rhDBroyek+JwvmS
	qm/V1Zvlti2ocJuejLA2U4szJmxX9+X79OoLai9nDwze/4fVt1DLnf7aQU+ewXrC
	oHtKrxqH+ahgvjz+fyKBRSg8lbO0qENIVlKXM8btd2L9IExh9ql/8FdTo=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.108])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkCm6wD5jgZriQAzAg--.35435S2;
	Wed, 25 Nov 2026 15:32:11 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: netdev@vger.kernel.org
Cc: netdev-bot+sinfo@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH] net: usb: mcs7830: skip zero-length register dump reads
Date: Wed, 25 Nov 2026 15:32:07 +0800
Message-Id: <20261125073207.3150-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179559139369.3294.9096901907598908535@kernel.org>
References: <20261125071649.7052-1-25031212351@stu.xidian.edu.cn> <179559139369.3294.9096901907598908535@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BLQMCkCm6wD5jgZriQAzAg--.35435S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO87k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr
	1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC
	4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAFwVW8CwCF04
	k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jnfHUUUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUID2sFqsqd9wACsm

Hi,

The issue was found during testing of the driver's ethtool register dump
path, not in production or from a bug report.  A bound MCS7830 interface
and CAP_NET_ADMIN are enough: requesting a zero-length register dump
(ETHTOOL_GREGS with regs.len = 0) reaches mcs7830_get_regs() and makes it
submit the zero-length vendor control-IN request that triggers the
warning.  It reproduces every time the ioctl is issued with len = 0.

Thanks,
YuanZhe Liu

