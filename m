Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.16.62.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966409;
	b=TJmLlpft0F6aVkoYPqaMT661fmGRXG/A7A23pAy9pxYwwtxlWsP2N6YjH5RE24RPVZdC
	 86NLZ++/VwKx8ZwYgJVBYXXdcwV0JIPGEEZgoDVcK4eHMCRUX0x5HF250cvK3zqscP/EC
	 hKI3RKn2gc6TpNXPDN+WFhxuvItAj2wLXpqwDnZo47xsTxsUF+hWQPuRNtokH1p6EU4Z8
	 G8qhjrHYWxOZEqYExtXzaf7tTc5IjpMvMEHe7e6NibWVx3Qp523nTbUibicB66kgnLXhx
	 gI7LHhJGuD/zfFmu6ANpsINqJj0Ysu/NTHgTW8vHH/6EZD8w3Y4ULwex9rbNhUQw4KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966409;
	h=DMARC-Filter:Received:DKIM-Filter:To:From:X-Ip:X-Ip-source:
	 Precedence:List-Unsubscribe:List-Unsubscribe-Post:Subject:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-MagazineId:
	 X-uId:X-Sender:X-Url:Message-Id:Date;
	bh=sujvEF8pQRywcRUm6psw9C2ytbWDQ3jL7t/ThwskqTE=;
	b=CrnlMxFczmDt/aa1lre2eiEMEOz/8Pk4NOI9T9LSpftiSy9fKTxj0RwSgH1HURiio+Qb
	 OfmcBCrBkc0Eu5Cd5+7eweBz68pRsFD8CL113jBy1a+TAGXcG88PXELRhQqZ/jowcJ/iz
	 5Wo4mT90kipBQNVFMDLChE4kvA+aKOXDG6uQFOt+lMLgXR3I0pDiU6qNT9vXQIeHy1MfW
	 o9H43w4RrcxKZApJfaRcBvPZCmZWCVeyUkdoo539EyFF7xR+vtuajFWCO5jCH+e3Z4NYb
	 kV4KTkV+ens3QQx5ArbvkPfZ6IZf67ROsrEfMw7OZJOEOkkRBE3dzu5dLj8q8gf6MZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ai-webseminar.jp;
	spf=pass smtp.mailfrom=magerr.combzmail.jp;
	arc=none smtp.remote-ip=160.16.62.121
Received: from r9205.ps.combzmail.jp (r9205.ps.combzmail.jp [160.16.62.121])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763D1606A325
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 01:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763D1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ai-webseminar.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9205.ps.combzmail.jp (Postfix, from userid 99)
	id 90841C5F56; Wed, 18 Nov 2026 10:45:12 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9205.ps.combzmail.jp 90841C5F56
To: linux-usb@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCTmtMWhsoQg==?= =?ISO-2022-JP?B?GyRCOkwhQxsoQg==?=
 AI =?ISO-2022-JP?B?GyRCJSghPCU4JSclcyVIM2hNUSU7JV8lSiE8O3ZMMzZJGyhC?= <info@ai-webseminar.jp>
X-Ip: 6604221110937754
X-Ip-source: k85gj7ft48dnsa51u0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCOkc2LyRORixHPiRIP008aiRyISMbKEI=?=
 =?ISO-2022-JP?B?Q2xhdWRlGyRCJTslXyVKITwbKEI=?=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: ft51
X-uId: 6764325639486067714159411023
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20261118014603.90841C5F56@r9205.ps.combzmail.jp>
Date: Wed, 18 Nov 2026 10:45:12 +0900 (JST)

　
　
　自分の間違いを見つけて「自己進化」する
　
　最強の「頭脳」と「人手」を手に入れたい
　経営層の方向けに
　
　2,000名超に講演してきたAIの専門家が
　驚きと手触り感のある実演デモで解説します。
　
　 ・自己進化するAIとは
　 ・受信メールから業務を自律実行
　 ・競合分析、SWOT分析から戦略立案
　 ・決算書から経営ダッシュボード生成
　 ・AI導入につかえる助成金情報
　
　
　 ＼ 明日から使えるプロンプトを進呈 ／
───────────────────────
　
　　　　−人手不足での倒産を防ぐ−
　　　　 　　Claude Code活用
　　   最強の頭脳と人手を手に入れる
　
　　 https://ai-webseminar.jp/claude/
　
　日程：11月26日（木）12:00-13:00　残り9席
　
　備考：Zoom開催／無料／60分／1社2名まで
　
───────────────────────
　
　人手不足による倒産が過去最多を更新する今。

　自らの間違いや非効率を見つけて「自己進化」し
　業務を動かしてくれる優秀な「人手」を逃す手はありません。
　
　そして、その人手をどう活かすかを決めるには
　経営者やリーダー層の視座が欠かせません。
　
　事前知識は不要です。
　非エンジニアの方にもイメージしやすい言葉でお話しします。
　
　今後の経営を変える60分。
　その驚きの実力を、画面越しにぜひ体感してください。
　
　
─…─…─…─…─…─…─…─…─…─…─…─…─…─…─…─…─
　[窓 口] AIエージェント活用セミナー事務局（イーアシスト内）
　[電 話] 0120-889-859
　[住 所] 大阪市中央区日本橋1-17-17 604号室

------------------------------------------------------------------

　メール受信を希望されない方は大変お手数ですが
　以下より配信解除をお願いいたします。
　※解除までに数日お時間をいただく場合がございます。
　https://ai-webseminar.jp/teishi/
─…─…─…─…─…─…─…─…─…─…─…─…─…─…─…─…─
