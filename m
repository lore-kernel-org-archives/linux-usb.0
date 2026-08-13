Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4701E46AA7B;
	Thu, 13 Aug 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634534; cv=none; b=HsxPyTRD+IfXCwo+CV1S37bk2LI9tmCI6sqvsjA7X8LkDyFJ6h8BJG5O5vVeJrqv7mIuFg2g2pQvK3D2wCnAZ10baEzFeE2ULYj8DQS9TTNpopB0+P+lVC+QNmMufR8D1Gwz4A3SZiMGd38QM1OdZlvuOnEzGmiL261kXTSGhRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634534; c=relaxed/simple;
	bh=6CO7I8E/SOvMpcRED8QlJN5UJ00XMpVzsojYqRxfFrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ezj4DbNuJVkIoBSwhsuuq5Vv8ce0ln3G+2wyO1hrAdf2GcQXDqorzbwlHwC8BL/osUaqBStR16qP6HOwZyc0BxhFnblv0660a57MI7mE2QPOWeKRTV/LglncoyNvGIgB6AJSvH7sS308HJzkPgBWSLGcU/DNGdz1UOqOuT1YdMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADnu+8e4X1qx4F5BQ--.55949S2;
	Thu, 13 Aug 2026 23:22:06 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rajmohan Mani <rajmohan.mani@intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3 0/2] thunderbolt: validate DROM entry extents
Date: Thu, 13 Aug 2026 23:22:06 +0800
Message-ID: <20260813152206.28059-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnu+8e4X1qx4F5BQ--.55949S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF48XFW3CFWxXr13Cr1fCrg_yoWkAFgE9r
	1v9r98G3y7AFnFkFZ7Kr43Zrya9FWjy34UZw1ktr93Ar95Jr48Zay29rn0qFn7Xr4rJF9r
	AwnIv3Z2yw17XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeTmhDU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The generic DROM walker can read a two-byte entry header from a one-byte
tail and accepts an entry whose declared length is shorter than that
header.  Separately, the USB4 product descriptor parser reads a complete
struct tb_drom_entry_desc without requiring that structure to be present.

Split those contracts into two patches.  The descriptor check now uses
sizeof(*desc), as requested by Mika Westerberg, instead of spelling out
the fields manually.

Changes since v2:
https://lore.kernel.org/all/20260731141700.3-thunderbolt-v2-pengpeng@iscas.ac.cn/
- split the generic entry and USB4 descriptor checks
- validate the USB4 entry with sizeof(*desc)
- rebase and re-review against the current tree

The series was reviewed statically. I did not test it with malformed
device DROM data.

Pengpeng Hou (2):
  thunderbolt: require complete DROM entry headers
  thunderbolt: validate USB4 product descriptor entry size

 drivers/thunderbolt/eeprom.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a

-- 
2.50.1 (Apple Git-155)

