Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5548A8D3
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265029; cv=none; b=aRwApNaxZNv5QtXcJohoa3h4iZH7mVnLGtzaACfD7potVRKASFVd4JtCkAZboLybxMnKjgcFFDR9SepiZMdz1vRDM6mW6O6RfiweMTHxoNol/MplwQAtwC+NtW5NnP+CABrcH90Rvrx0zHSCDQPG8xm4BF9GH46QFMGeI1fF2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265029; c=relaxed/simple;
	bh=p1Bl/hQOGmkXAsDn0QsWy1/1PzqoCI2TuIUFGNAaDJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RH20jBC4NCtNIYQk0FiwP3dkP7YDz85BK8eG660teWbvP71K4yOhQ2LjEPx7znjOADCZVj25TdDTG2ugWaK2047etbjAqvZ9VkB1iO4CAIy/AbFrkh2EFIdgxnZ1Jz+Fl9tMczTsPjKbjfesnC1y4CtSPus6FHl8ea62ntfirW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 236891202F6F8;
	Tue, 01 Sep 2026 14:09:25 +0200 (CEST)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	michael.bommarito@gmail.com,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 0/3] usb: gadget: f_fs: cancellation and mm fixes
Date: Tue,  1 Sep 2026 14:09:05 +0200
Message-ID: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1788264565203

This 3 part patch series does some mini refactoring and
fixes two previous commits.

Ingo Rohloff (3):
  usb: gadget: f_fs: simplify error handling using goto
  usb: gadget: f_fs: register cancellation handler only after request
    queueing
  usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance.

 drivers/usb/gadget/function/f_fs.c | 132 +++++++++++++++--------------
 1 file changed, 68 insertions(+), 64 deletions(-)

--
2.55.0
