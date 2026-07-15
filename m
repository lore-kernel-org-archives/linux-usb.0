Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1121A3C3450
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109495; cv=none; b=QF5S5Pz02hdm4CBCg/2EQxcazkLDOFWCXpHNvTgON2NcoHhlbiYGJU0IQrNvByIDyurLU2wbNx6CKWZzwY01puiNP8UXpxrRSpZo+itefLdJqTW+rpuzwWTqEQG/H2q+HofhdMb6UWiVIG6qPTlIYG9bkGD9HEY39c8JQigQ/4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109495; c=relaxed/simple;
	bh=eu/DTRyAd3ctyUkGms/b9eysJ/qFhgx/TcHRNsFcw4Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DUverlGzZNgqSRXM+6CbfYTEoCCgtsGBWXz83vXrP/14quPBKojPNrfPQXMr4pFun8TuVTZYNbXehD50xPdgwHAos63PnpGzpPhmsrg65QWZ5zynCYD6bh+r8X6/2qjI57Kvl29vfnMNRVlV8wkOmFYXfgbNy8IIwyeK8heFp2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=bRE0o0dl; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="bRE0o0dl"
DKIM-Signature: a=rsa-sha256; b=bRE0o0dl2Dmy34M3RSRuprEpB+PkUDpuwnXOzbdBfUzjbefpUWu4ceLsdoeHArt79qKQsdP4WLXPP09zSOpLHTp0QkNFy8fapMPd061zH1+dZonKeYYqVWgKIt4t+Ky4c+6/Ie37e/WE0h+viSc4cn07XoNb0T89acKrnxvTQztXBiz4VAiyJNIIapYrdBT9gm4z5SrAWmSi3AffRq7L0+Z6VhrmV6p2vuXD3wnMNg3B62MCuda1F43itj7/OK5tD25WcM0CktB9OI8EFeLMaArNqUMoykurJnlQ7jNAZlg6ALFSInMPQFM1cSMlzSjpx+rB2jeCcNFCrQ+Wk3WllA==; s=purelymail1; d=purelymail.com; v=1; bh=eu/DTRyAd3ctyUkGms/b9eysJ/qFhgx/TcHRNsFcw4Q=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 79204510;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 15 Jul 2026 09:57:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1wjwNE-00000000ArY-2ga3;
	Wed, 15 Jul 2026 11:57:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ming Qing <a0yami@mailbox.org>,  linux-usb@vger.kernel.org,
  julian@jusst.de,  Pavel Hofman <pavel.hofman@ivitera.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: f_uac2: fix memory leak in
 UAC2_RATE_ATTRIBUTE store
In-Reply-To: <2026071044-goggles-preview-5a9c@gregkh> (Greg KH's message of
	"Fri, 10 Jul 2026 14:56:59 +0200")
References: <20260609091957.2716984-1-peter@korsgaard.com>
	<87zf0xmpfv.fsf@dell.be.48ers.dk>
	<6564238.328878.1781520721949@app.mailbox.org>
	<2026071044-goggles-preview-5a9c@gregkh>
Date: Wed, 15 Jul 2026 11:57:52 +0200
Message-ID: <87ldbc7exr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Greg" == Greg KH <gregkh@linuxfoundation.org> writes:

 > On Mon, Jun 15, 2026 at 06:52:01PM +0800, Ming Qing wrote:
 >> On Sun, Jun 14, 2026 at 5:39 PM +0800, Peter Korsgaard wrote:
 >> > FYI, I see the same issue is also fixed in the recently proposed
 >> > "[PATCH] usb: gadget: uac: validate rate list length before storing"
 >> > 
 >> > https://lore.kernel.org/linux-usb/20260519143319.147494-1-a0yami@mailbox.org/
 >> 
 >> Yes, that includes the same buffer lifetime fix. I'm happy to split
 >> it up if that makes it easier to pick.
 >> 

 > Please do, I just took that one now and this series does not apply.

With "usb: gadget: uac: validate rate list length before storing"
applied, these two patches are afaik no longer needed as that patch also
fixes the same leak.

-- 
Bye, Peter Korsgaard
